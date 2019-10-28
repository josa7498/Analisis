using System.Web.Mvc;

namespace Proyecto.UI.Controllers
{
    public class HomeController : Controller
    {
        [HttpGet]
        public ActionResult Index()
        {
            return View("Index");
        }

        [HttpGet]
        public ActionResult AnotherLink()
        {
            return View("Index");
        }

        [HttpGet]
        public ActionResult Login()
        {
            return View("Login");
        }
    }
}
