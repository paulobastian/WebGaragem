using System;
using System.Collections.Generic;
using System.IO;
using System.Linq;
using System.Threading.Tasks;
using Microsoft.AspNetCore.Mvc;
using Microsoft.AspNetCore.Mvc.Rendering;
using Microsoft.CodeAnalysis;
using Microsoft.EntityFrameworkCore;
using Microsoft.EntityFrameworkCore.Query.ExpressionTranslators.Internal;
using PdfSharpCore.Drawing;
using WebGaragem.Data;
using WebGaragem.Models.Entidades;
using static Microsoft.EntityFrameworkCore.DbLoggerCategory;

namespace WebGaragem.Controllers
{

    public class AnunciosController : BaseController
    {
        private readonly ApplicationDbContext _context;

        public AnunciosController(ApplicationDbContext context)
        {
            _context = context;
        }

        // GET: Anuncios
        public async Task<IActionResult> Index(string searchDtIni, string searchDtFim)
        {
            var temAcesso = await Usuario_Tem_Acesso(8, _context);

            if (!temAcesso)
            {
                return RedirectToAction("Index", "Home");
            }

            ViewData["CurrentFilter"] = searchDtIni;
            ViewData["CurrentFilter"] = searchDtFim;

            if (!String.IsNullOrEmpty(searchDtIni) && !String.IsNullOrEmpty(searchDtFim))
            {
                
                FileResult fileResult = GerarRelatorio(searchDtIni, searchDtFim);
                return fileResult;
            }

            var webGaragemContext = _context.Anuncio.Include(a => a.Marca).Include(a => a.Modelo);
            return View(await webGaragemContext.ToListAsync());
        }

        // GET: Anuncios/Details/5
        public async Task<IActionResult> Details(int? id)
        {
            if (id == null)
            {
                return NotFound();
            }

            var anuncio = await _context.Anuncio
                .Include(a => a.Marca)
                .Include(a => a.Modelo)
                .FirstOrDefaultAsync(m => m.ID == id);
            if (anuncio == null)
            {
                return NotFound();
            }

            return View(anuncio);
        }

        // GET: Anuncios/Create
        public IActionResult Create()
        {
            ViewData["IdMarca"] = new SelectList(_context.Marca, "ID", "NomeMarca");
            ViewData["IdModelo"] = new SelectList(_context.Modelo, "ID", "NomeModelo");
            return View();
        }

        // POST: Anuncios/Create
        // To protect from overposting attacks, please enable the specific properties you want to bind to, for 
        // more details see http://go.microsoft.com/fwlink/?LinkId=317598.
        [HttpPost]
        [ValidateAntiForgeryToken]
        public async Task<IActionResult> Create([Bind("ID,IdMarca,IdModelo,AnoVeiculo,ValorCompra,ValorVenda,Cor,TipoCombustivel,DataVenda")] Anuncio anuncio)
        {
            if (ModelState.IsValid)
            {
                _context.Add(anuncio);
                await _context.SaveChangesAsync();
                return RedirectToAction(nameof(Index));
            }
            ViewData["IdMarca"] = new SelectList(_context.Marca, "ID", "NomeMarca", anuncio.IdMarca);
            ViewData["IdModelo"] = new SelectList(_context.Modelo, "ID", "NomeModelo", anuncio.IdModelo);
            return View(anuncio);
        }

        // GET: Anuncios/Edit/5
        public async Task<IActionResult> Edit(int? id)
        {
            if (id == null)
            {
                return NotFound();
            }

            var anuncio = await _context.Anuncio.FindAsync(id);
            if (anuncio == null)
            {
                return NotFound();
            }
            ViewData["IdMarca"] = new SelectList(_context.Marca, "ID", "NomeMarca", anuncio.IdMarca);
            ViewData["IdModelo"] = new SelectList(_context.Modelo, "ID", "NomeModelo", anuncio.IdModelo);
            return View(anuncio);
        }

        // POST: Anuncios/Edit/5
        // To protect from overposting attacks, please enable the specific properties you want to bind to, for 
        // more details see http://go.microsoft.com/fwlink/?LinkId=317598.
        [HttpPost]
        [ValidateAntiForgeryToken]
        public async Task<IActionResult> Edit(int id, [Bind("ID,IdMarca,IdModelo,AnoVeiculo,ValorCompra,ValorVenda,Cor,TipoCombustivel,DataVenda")] Anuncio anuncio)
        {
            if (id != anuncio.ID)
            {
                return NotFound();
            }

            if (ModelState.IsValid)
            {
                try
                {
                    _context.Update(anuncio);
                    await _context.SaveChangesAsync();
                }
                catch (DbUpdateConcurrencyException)
                {
                    if (!AnuncioExists(anuncio.ID))
                    {
                        return NotFound();
                    }
                    else
                    {
                        throw;
                    }
                }
                return RedirectToAction(nameof(Index));
            }
            ViewData["IdMarca"] = new SelectList(_context.Marca, "ID", "NomeMarca", anuncio.IdMarca);
            ViewData["IdModelo"] = new SelectList(_context.Modelo, "ID", "NomeModelo", anuncio.IdModelo);
            return View(anuncio);
        }

        // GET: Anuncios/Delete/5
        public async Task<IActionResult> Delete(int? id)
        {
            if (id == null)
            {
                return NotFound();
            }

            var anuncio = await _context.Anuncio
                .Include(a => a.Marca)
                .Include(a => a.Modelo)
                .FirstOrDefaultAsync(m => m.ID == id);
            if (anuncio == null)
            {
                return NotFound();
            }

            return View(anuncio);
        }

        // POST: Anuncios/Delete/5
        [HttpPost, ActionName("Delete")]
        [ValidateAntiForgeryToken]
        public async Task<IActionResult> DeleteConfirmed(int id)
        {
            var anuncio = await _context.Anuncio.FindAsync(id);
            _context.Anuncio.Remove(anuncio);
            await _context.SaveChangesAsync();
            return RedirectToAction(nameof(Index));
        }

        private bool AnuncioExists(int id)
        {
            return _context.Anuncio.Any(e => e.ID == id);
        }

        //DateTime searchDtIni, DateTime searchDtFim
        public FileResult GerarRelatorio(String searchDtIni, String searchDtFim)
        {

            using (var doc = new PdfSharpCore.Pdf.PdfDocument())
            {
                var page = doc.AddPage();
                page.Size = PdfSharpCore.PageSize.A4;
                page.Orientation = PdfSharpCore.PageOrientation.Portrait;
                var graphics = PdfSharpCore.Drawing.XGraphics.FromPdfPage(page);
                var corFonte = PdfSharpCore.Drawing.XBrushes.Black;

                var textFormatter = new PdfSharpCore.Drawing.Layout.XTextFormatter(graphics);
                var fonteOrganzacao = new PdfSharpCore.Drawing.XFont("Arial", 10);
                var fonteDescricao = new PdfSharpCore.Drawing.XFont("Arial", 8, PdfSharpCore.Drawing.XFontStyle.BoldItalic);
                var titulodetalhes = new PdfSharpCore.Drawing.XFont("Arial", 14, PdfSharpCore.Drawing.XFontStyle.Bold);
                var fonteDetalhesDescricao = new PdfSharpCore.Drawing.XFont("Arial", 7);

                var logo = @"Imgs\logo_questorQ.png";

                var qtdPaginas = doc.PageCount;
                textFormatter.DrawString(qtdPaginas.ToString(), new PdfSharpCore.Drawing.XFont("Arial", 10), corFonte, new PdfSharpCore.Drawing.XRect(578, 825, page.Width, page.Height));

                // Impressão do LogoTipo
                XImage imagem = XImage.FromFile(logo);
                graphics.DrawImage(imagem, 20, 5, 300, 50);

                // Titulo Exibição
                textFormatter.DrawString("Nome :", fonteDescricao, corFonte, new PdfSharpCore.Drawing.XRect(20, 75, page.Width, page.Height));
                textFormatter.DrawString("João", fonteOrganzacao, corFonte, new PdfSharpCore.Drawing.XRect(80, 75, page.Width, page.Height));

                textFormatter.DrawString("Loja :", fonteDescricao, corFonte, new PdfSharpCore.Drawing.XRect(20, 95, page.Width, page.Height));
                textFormatter.DrawString("Garagem do João", fonteOrganzacao, corFonte, new PdfSharpCore.Drawing.XRect(80, 95, page.Width, page.Height));

                // Titulo maior 
                var tituloDetalhes = new PdfSharpCore.Drawing.Layout.XTextFormatter(graphics);
                tituloDetalhes.Alignment = PdfSharpCore.Drawing.Layout.XParagraphAlignment.Center;
                tituloDetalhes.DrawString("Anuncios ", titulodetalhes, corFonte, new PdfSharpCore.Drawing.XRect(0, 120, page.Width, page.Height));

                // titulo das colunas
                var alturaTituloDetalhesY = 140;
                var detalhes = new PdfSharpCore.Drawing.Layout.XTextFormatter(graphics);

                detalhes.DrawString("Marca", fonteDescricao, corFonte, new PdfSharpCore.Drawing.XRect(20, alturaTituloDetalhesY, page.Width, page.Height));
                detalhes.DrawString("Modelo", fonteDescricao, corFonte, new PdfSharpCore.Drawing.XRect(80, alturaTituloDetalhesY, page.Width, page.Height));
                detalhes.DrawString("Ano Veiculo", fonteDescricao, corFonte, new PdfSharpCore.Drawing.XRect(120, alturaTituloDetalhesY, page.Width, page.Height));
                detalhes.DrawString("Valor de Venda", fonteDescricao, corFonte, new PdfSharpCore.Drawing.XRect(180, alturaTituloDetalhesY, page.Width, page.Height));
                detalhes.DrawString("Lucro", fonteDescricao, corFonte, new PdfSharpCore.Drawing.XRect(250, alturaTituloDetalhesY, page.Width, page.Height));
                detalhes.DrawString("Data Venda", fonteDescricao, corFonte, new PdfSharpCore.Drawing.XRect(350, alturaTituloDetalhesY, page.Width, page.Height));

                //dados do relatório 
                var alturaDetalhesItens = 160;

                DateTime dateIni = DateTime.ParseExact(searchDtIni, "dd/MM/yyyy", null);
                DateTime dateFim = DateTime.ParseExact(searchDtFim, "dd/MM/yyyy", null);              

                var anuncioss = from AN in _context.Anuncio
                                join MA in _context.Marca on AN.IdMarca equals MA.ID                                
                                where AN.DataVenda >= dateIni && AN.DataVenda <= dateFim
                                select AN;

                var webGaragemContext = anuncioss.Include(a => a.Marca).Include(a => a.Modelo);

                foreach (var item in webGaragemContext)
                {
                    textFormatter.DrawString(item.Marca.NomeMarca, fonteDetalhesDescricao, corFonte, new PdfSharpCore.Drawing.XRect(21, alturaDetalhesItens, page.Width, page.Height));
                    textFormatter.DrawString(item.Modelo.NomeModelo, fonteDetalhesDescricao, corFonte, new PdfSharpCore.Drawing.XRect(80, alturaDetalhesItens, page.Width, page.Height));
                    textFormatter.DrawString(item.AnoVeiculo, fonteDetalhesDescricao, corFonte, new PdfSharpCore.Drawing.XRect(120, alturaDetalhesItens, page.Width, page.Height));
                    textFormatter.DrawString(item.ValorVenda.ToString(), fonteDetalhesDescricao, corFonte, new PdfSharpCore.Drawing.XRect(180, alturaDetalhesItens, page.Width, page.Height));
                    textFormatter.DrawString((item.ValorVenda - item.ValorCompra).ToString(), fonteDetalhesDescricao, corFonte, new PdfSharpCore.Drawing.XRect(250, alturaDetalhesItens, page.Width, page.Height));
                    textFormatter.DrawString(item.DataVenda.ToString(), fonteDetalhesDescricao, corFonte, new PdfSharpCore.Drawing.XRect(350, alturaDetalhesItens, page.Width, page.Height));

                    alturaDetalhesItens += 20;
                }

                using (MemoryStream stream = new MemoryStream())
                {
                    var contantType = "application/pdf";
                    doc.Save(stream, false);

                    var nomeArquivo = "RelatorioJoao.pdf";

                    return File(stream.ToArray(), contantType, nomeArquivo);
                }
            }
        }
    }
}
