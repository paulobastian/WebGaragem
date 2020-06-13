using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.ComponentModel.DataAnnotations.Schema;
using System.Linq;
using System.Threading.Tasks;

namespace WebGaragem.Models.Entidades
{
    [Table("Modelo")]
    public class Modelo
    {
        [Display(Description = "Modelo")]
        public int ID { get; set; }

        [Display(Description = "Nome do Modelo")]
        public string NomeModelo { get; set; }

    }
}
