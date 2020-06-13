using System;
using System.Collections.Generic;
using System.Diagnostics;
using System.IO;
using System.Linq;
using System.Threading.Tasks;
using Microsoft.AspNetCore.Mvc;
using Microsoft.AspNetCore.Mvc.Rendering;
using Microsoft.EntityFrameworkCore;
using PdfSharpCore.Drawing;
using WebGaragem.Data;
using WebGaragem.Models;
using WebGaragem.Models.Entidades;

namespace WebGaragem.Controllers
{
    public class HomeController : BaseController//Controller
    {
        public IActionResult Index()
        {
            return View();
        }
        
        public IActionResult Privacy()
        {
            return View();
        }

        [ResponseCache(Duration = 0, Location = ResponseCacheLocation.None, NoStore = true)]
        public IActionResult Error()
        {
            return View(new ErrorViewModel { RequestId = Activity.Current?.Id ?? HttpContext.TraceIdentifier });
        }

        //public FileResult GerarRelatorio()
        //{
        //    using (var doc = new PdfSharpCore.Pdf.PdfDocument())
        //    {
        //        var page = doc.AddPage();
        //        page.Size = PdfSharpCore.PageSize.A4;
        //        page.Orientation = PdfSharpCore.PageOrientation.Portrait;
        //        var graphics = PdfSharpCore.Drawing.XGraphics.FromPdfPage(page);
        //        var corFonte = PdfSharpCore.Drawing.XBrushes.Black;

        //        var textFormatter = new PdfSharpCore.Drawing.Layout.XTextFormatter(graphics);
        //        var fonteOrganzacao = new PdfSharpCore.Drawing.XFont("Arial", 10);
        //        var fonteDescricao = new PdfSharpCore.Drawing.XFont("Arial", 8, PdfSharpCore.Drawing.XFontStyle.BoldItalic);
        //        var titulodetalhes = new PdfSharpCore.Drawing.XFont("Arial", 14, PdfSharpCore.Drawing.XFontStyle.Bold);
        //        var fonteDetalhesDescricao = new PdfSharpCore.Drawing.XFont("Arial", 7);

        //        var logo = @"C:\Users\pc\source\repos\WebAnuncio\WebGaragem\WebGaragem\Imgs\logo_questorQ.png";

        //        var qtdPaginas = doc.PageCount;
        //        textFormatter.DrawString(qtdPaginas.ToString(), new PdfSharpCore.Drawing.XFont("Arial", 10), corFonte, new PdfSharpCore.Drawing.XRect(578, 825, page.Width, page.Height));

        //        // Impressão do LogoTipo
        //        XImage imagem = XImage.FromFile(logo);
        //        graphics.DrawImage(imagem, 20, 5, 300, 50);

        //        // Titulo Exibição
        //        textFormatter.DrawString("Nome :", fonteDescricao, corFonte, new PdfSharpCore.Drawing.XRect(20, 75, page.Width, page.Height));
        //        textFormatter.DrawString("João", fonteOrganzacao, corFonte, new PdfSharpCore.Drawing.XRect(80, 75, page.Width, page.Height));

        //        textFormatter.DrawString("Loja :", fonteDescricao, corFonte, new PdfSharpCore.Drawing.XRect(20, 95, page.Width, page.Height));
        //        textFormatter.DrawString("Garagem do João", fonteOrganzacao, corFonte, new PdfSharpCore.Drawing.XRect(80, 95, page.Width, page.Height));

        //        // Titulo maior 
        //        var tituloDetalhes = new PdfSharpCore.Drawing.Layout.XTextFormatter(graphics);
        //        tituloDetalhes.Alignment = PdfSharpCore.Drawing.Layout.XParagraphAlignment.Center;
        //        tituloDetalhes.DrawString("Anuncios ", titulodetalhes, corFonte, new PdfSharpCore.Drawing.XRect(0, 120, page.Width, page.Height));

        //        // titulo das colunas
        //        var alturaTituloDetalhesY = 140;
        //        var detalhes = new PdfSharpCore.Drawing.Layout.XTextFormatter(graphics);

        //        detalhes.DrawString("Marca", fonteDescricao, corFonte, new PdfSharpCore.Drawing.XRect(20, alturaTituloDetalhesY, page.Width, page.Height));
        //        detalhes.DrawString("Modelo", fonteDescricao, corFonte, new PdfSharpCore.Drawing.XRect(80, alturaTituloDetalhesY, page.Width, page.Height));
        //        detalhes.DrawString("Ano Veiculo", fonteDescricao, corFonte, new PdfSharpCore.Drawing.XRect(120, alturaTituloDetalhesY, page.Width, page.Height));
        //        detalhes.DrawString("Valor de Venda", fonteDescricao, corFonte, new PdfSharpCore.Drawing.XRect(180, alturaTituloDetalhesY, page.Width, page.Height));
        //        detalhes.DrawString("Lucro", fonteDescricao, corFonte, new PdfSharpCore.Drawing.XRect(250, alturaTituloDetalhesY, page.Width, page.Height));
        //        detalhes.DrawString("Data Venda", fonteDescricao, corFonte, new PdfSharpCore.Drawing.XRect(350, alturaTituloDetalhesY, page.Width, page.Height));


        //        //dados do relatório 
        //        var alturaDetalhesItens = 160;
        //        for (int i = 1; i < 30; i++)
        //        {

        //            textFormatter.DrawString("Marca" + " : " + i.ToString(), fonteDetalhesDescricao, corFonte, new PdfSharpCore.Drawing.XRect(21, alturaDetalhesItens, page.Width, page.Height));
        //            textFormatter.DrawString("Modelo" + " : " + i.ToString(), fonteDetalhesDescricao, corFonte, new PdfSharpCore.Drawing.XRect(145, alturaDetalhesItens, page.Width, page.Height));
        //            textFormatter.DrawString("Ano Veiculo" + " : " + i.ToString(), fonteDetalhesDescricao, corFonte, new PdfSharpCore.Drawing.XRect(215, alturaDetalhesItens, page.Width, page.Height));
        //            textFormatter.DrawString("Valor de Venda" + " : " + i.ToString(), fonteDetalhesDescricao, corFonte, new PdfSharpCore.Drawing.XRect(290, alturaDetalhesItens, page.Width, page.Height));
        //            textFormatter.DrawString("Lucro" + " : " + i.ToString(), fonteDetalhesDescricao, corFonte, new PdfSharpCore.Drawing.XRect(332, alturaDetalhesItens, page.Width, page.Height));
        //            textFormatter.DrawString(DateTime.Now.ToString(), fonteDetalhesDescricao, corFonte, new PdfSharpCore.Drawing.XRect(400, alturaDetalhesItens, page.Width, page.Height));

        //            alturaDetalhesItens += 20;
        //        }






        //        using (MemoryStream stream = new MemoryStream())
        //        {
        //            var contantType = "application/pdf";
        //            doc.Save(stream, false);

        //            var nomeArquivo = "RelatorioPaulo.pdf";

        //            return File(stream.ToArray(), contantType, nomeArquivo);
        //        }
        //    }
        //}
    }
}
