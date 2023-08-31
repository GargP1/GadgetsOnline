using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace GadgetsOnline.Repository
{
    public class DataResult<T>
    {
        public bool Completed { get; set; }
        public T Data { get; set; }
        public string Reason { get; set; }
    }
}