using System;
using System.Collections.Generic;
using System.Data;
using System.Data.Entity;
using System.Linq;
using System.Net;
using System.Web;
using System.Web.Mvc;
using JobsForJoe.Data.EF;
using Microsoft.AspNet.Identity;

namespace JobsForJoe.UI.MVC.Controllers
{
    [Authorize(Roles = ("Admin, Store Manager"))]
    public class LocationsController : Controller
    {
        private JobsForJoeEntities db = new JobsForJoeEntities();

        // GET: Locations
        public ActionResult Index()
        {
            List<UserDetail> deets = db.UserDetails.ToList();
            ViewBag.UserDetails = deets;

            if (User.IsInRole("Admin"))
            {
                return View(db.Locations.ToList());
            }
            else
            {
                string currentUserId = User.Identity.GetUserId();
                return View(db.Locations.Where(x => x.ManagerID == currentUserId));
            }

            
            //return View(db.Locations.ToList());
        }

        // GET: Locations/Details/5
        public ActionResult Details(int? id)
        {
            List<UserDetail> deets = db.UserDetails.ToList();
            ViewBag.UserDetails = deets;

            if (id == null)
            {
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            }
            Location location = db.Locations.Find(id);
            if (location == null)
            {
                return HttpNotFound();
            }
            return View(location);
        }

        // GET: Locations/Create
        [Authorize(Roles ="Admin")]
        public ActionResult Create()
        {
            //Gets all UserIDS in the role of Store MAnager
            var managerRole = db.AspNetUserRoles.Where(m => m.RoleId == "52135fa2-3c96-4562-af11-5c4742af7d1a");

            //Create a list to eventually add managers to
            List<UserDetail> managers = new List<UserDetail>();

            //Loops through all user in the UserDetail table.
            foreach (UserDetail user in db.UserDetails)
            {
                //Loops through all ids in the managerRole variable
                foreach (var manager in managerRole)
                {
                    if (user.UserID == manager.UserId)
                    {
                        managers.Add(user);
                    }
                }
            }

            //Creates a SelectList for the Create View of Full Names of all Managers
            ViewBag.ManagerID = new SelectList(managers, "UserID", "FirstName");
            return View();
        }

        // POST: Locations/Create
        // To protect from overposting attacks, please enable the specific properties you want to bind to, for 
        // more details see http://go.microsoft.com/fwlink/?LinkId=317598.
        [HttpPost]
        [ValidateAntiForgeryToken]
        public ActionResult Create([Bind(Include = "LocationID,StoreName,StoreNumber,City,State,ManagerID,StoreImage")] Location location)
        {
            if (ModelState.IsValid)
            {

                db.Locations.Add(location);
                db.SaveChanges();
                return RedirectToAction("Index");
            }

            return View(location);
        }

        // GET: Locations/Edit/5
        public ActionResult Edit(int? id)
        {
            if (id == null)
            {
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            }
            Location location = db.Locations.Find(id);
            if (location == null)
            {
                return HttpNotFound();
            }
            return View(location);
        }

        // POST: Locations/Edit/5
        // To protect from overposting attacks, please enable the specific properties you want to bind to, for 
        // more details see http://go.microsoft.com/fwlink/?LinkId=317598.
        [HttpPost]
        [ValidateAntiForgeryToken]
        public ActionResult Edit([Bind(Include = "LocationID,StoreName,StoreNumber,City,State,ManagerID,StoreImage")] Location location)
        {
            if (ModelState.IsValid)
            {
                db.Entry(location).State = EntityState.Modified;
                db.SaveChanges();
                return RedirectToAction("Index");
            }
            return View(location);
        }

        // GET: Locations/Delete/5
        public ActionResult Delete(int? id)
        {
            if (id == null)
            {
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            }
            Location location = db.Locations.Find(id);
            if (location == null)
            {
                return HttpNotFound();
            }
            return View(location);
        }

        // POST: Locations/Delete/5
        [HttpPost, ActionName("Delete")]
        [ValidateAntiForgeryToken]
        public ActionResult DeleteConfirmed(int id)
        {
            Location location = db.Locations.Find(id);
            db.Locations.Remove(location);
            db.SaveChanges();
            return RedirectToAction("Index");
        }

        protected override void Dispose(bool disposing)
        {
            if (disposing)
            {
                db.Dispose();
            }
            base.Dispose(disposing);
        }
    }
}
