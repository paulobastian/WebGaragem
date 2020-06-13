using Microsoft.AspNetCore.Identity;
using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.ComponentModel.DataAnnotations.Schema;
using System.Linq;
using System.Threading.Tasks;

namespace WebGaragem.Models.Entidades
{
    [Table("Anuncio")]
    public class Anuncio
    {
        [Display(Description = "Anuncio")]
        public int ID { get; set; }

        [Display(Name = "Marca")]
        [ForeignKey("Marca")]
        [Column(Order = 1)]
        public int IdMarca{ get; set; }
        public virtual Marca Marca { get; set; }

        [Display(Name = "Modelo")]
        [ForeignKey("Modelo")]
        [Column(Order = 1)]        
        public int IdModelo { get; set; }
        public virtual Modelo Modelo { get; set; }


        [Display(Description = "Ano")]
        [Required(ErrorMessage = "O campo Ano é obrigatório.")]
        public string AnoVeiculo { get; set; }

        [Display(Description = "Valor Compra")]
        [Required(ErrorMessage = "O campo Valor Compra é obrigatório.")]
        public Double ValorCompra { get; set; }

       
        [Display(Description = "Valor Venda")]
        [Required(ErrorMessage = "O campo Valor Venda é obrigatório.")]
        public Double ValorVenda { get; set; }

        [Display(Description = "Cor Veiculo")]
        [Required(ErrorMessage = "O campo Cor do veiculo é obrigatório.")]
        public string Cor { get; set; }

        [Display(Description = "Tipo Combustivel")]
        [Required(ErrorMessage = "O campo Tipo do Combustivel é obrigatório.")]
        public string TipoCombustivel { get; set; }

        [Display(Description = "Data Venda")]
        [DataType(DataType.Date)]
        [DisplayFormat(DataFormatString = "{0:dd-MM-yyyy}", ApplyFormatInEditMode = true)]
        public DateTime DataVenda { get; set; }

    }
}
