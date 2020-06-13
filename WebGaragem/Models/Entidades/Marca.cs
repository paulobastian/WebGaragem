using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.ComponentModel.DataAnnotations.Schema;
using System.Linq;
using System.Threading.Tasks;

namespace WebGaragem.Models.Entidades
{
    [Table("Marca")]
    public class Marca
    {
        [Display(Description = "Marca")]
        public int ID { get; set; }

        [Display(Description = "Nome da Marca")]
        public string NomeMarca { get; set; }

    }
}
