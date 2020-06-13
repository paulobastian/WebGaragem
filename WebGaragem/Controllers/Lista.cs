using Microsoft.AspNetCore.Mvc;
using Microsoft.AspNetCore.Mvc.Rendering;
using Microsoft.EntityFrameworkCore;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;
using WebGaragem.Data;
using WebGaragem.Models.Entidades;

namespace WebGaragem.Controllers
{
    public class Lista : Controller
    {
        private readonly ApplicationDbContext _context;

        public Lista(ApplicationDbContext context)
        {
            _context = context;
        }

        // GET: Anuncios
        public async Task<IActionResult> Index(string searchMarca)
        {            
            ViewData["CurrentFilter"] = searchMarca;
         
            if (!String.IsNullOrEmpty(searchMarca))
            {
                var anuncioss = from AN in _context.Anuncio
                                join MA in _context.Marca on AN.IdMarca equals MA.ID
                                where MA.NomeMarca == searchMarca
                                select AN;

                var webGaragemContext = anuncioss.Include(a => a.Marca).Include(a => a.Modelo);
                return View(await webGaragemContext.AsNoTracking().ToListAsync());
            } else
            {
                var webGaragemContext = _context.Anuncio.Include(a => a.Marca).Include(a => a.Modelo);
                return View(await webGaragemContext.ToListAsync());
            }

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

        private bool AnuncioExists(int id)
        {
            return _context.Anuncio.Any(e => e.ID == id);
        }

    
    }
}
