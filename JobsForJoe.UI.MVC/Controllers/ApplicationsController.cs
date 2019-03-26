using System;
using System.Collections.Generic;
using System.Data;
using System.Data.Entity;
using System.Linq;
using System.Net;
using System.Web;
using System.Web.Mvc;
using JobsForJoe.Data.EF;
using JobsForJoe.UI.MVC.Models;
using Microsoft.AspNet.Identity;

namespace JobsForJoe.UI.MVC.Controllers
{
    [Authorize(Roles = "Admin,Store Manager, Employee")]
    public class ApplicationsController : Controller
    {
        private JobsForJoeEntities db = new JobsForJoeEntities();

        // GET: Applications
        public ActionResult Index(OneClickApply model)
        {
            //var applications = db.Applications.Include(a => a.OpenPosition);
            //return View(applications.ToList());
            //User is only able to 

            List<UserDetail> deets = db.UserDetails.ToList();
            ViewBag.UserDetails = deets;

            if (User.IsInRole("Admin"))
            {
                var applications = db.Applications.Include(a => a.OpenPosition);
                return View(applications.ToList());
            }
            else
            {
                string currentUserId = User.Identity.GetUserId();
                return View(db.Applications.Where(x => x.UserID == currentUserId));
            }


            
            
        }

        // GET: Applications/Details/5
        public ActionResult Details(int? id)
        {
            if (id == null)
            {
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            }
            Application application = db.Applications.Find(id);
            if (application == null)
            {
                return HttpNotFound();
            }
            return View(application);
        }

        // GET: Applications/Create
        public ActionResult Create()
        {
            ViewBag.OpenPositionID = new SelectList(db.OpenPositions, "OpenPositionID", "OpenPositionID");
            return View();
        }

        // POST: Applications/Create
        // To protect from overposting attacks, please enable the specific properties you want to bind to, for 
        // more details see http://go.microsoft.com/fwlink/?LinkId=317598.
        [HttpPost]
        [ValidateAntiForgeryToken]
        public ActionResult Create([Bind(Include = "ApplicationsID,OpenPositionID,UserID,ApplicationDate,ManagerNotes,IsDeclined,ResumeFilename")] Application application)
        {
            if (ModelState.IsValid)
            {
                db.Applications.Add(application);
                db.SaveChanges();
                return RedirectToAction("Index");
            }

            ViewBag.OpenPositionID = new SelectList(db.OpenPositions, "OpenPositionID", "OpenPositionID", application.OpenPositionID);
            return View(application);
        }

        // GET: Applications/Edit/5
        public ActionResult Edit(int? id)
        {
            if (id == null)
            {
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            }
            Application application = db.Applications.Find(id);
            if (application == null)
            {
                return HttpNotFound();
            }
            ViewBag.OpenPositionID = new SelectList(db.OpenPositions, "OpenPositionID", "OpenPositionID", application.OpenPositionID);
            return View(application);
        }

        // POST: Applications/Edit/5
        // To protect from overposting attacks, please enable the specific properties you want to bind to, for 
        // more details see http://go.microsoft.com/fwlink/?LinkId=317598.
        [HttpPost]
        [ValidateAntiForgeryToken]
        public ActionResult Edit([Bind(Include = "ApplicationsID,OpenPositionID,UserID,ApplicationDate,ManagerNotes,IsDeclined,ResumeFilename")] Application application)
        {
            if (ModelState.IsValid)
            {
                db.Entry(application).State = EntityState.Modified;
                db.SaveChanges();
                return RedirectToAction("Index");
            }
            ViewBag.OpenPositionID = new SelectList(db.OpenPositions, "OpenPositionID", "OpenPositionID", application.OpenPositionID);
            return View(application);
        }

        // GET: Applications/Delete/5
        public ActionResult Delete(int? id)
        {
            if (id == null)
            {
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            }
            Application application = db.Applications.Find(id);
            if (application == null)
            {
                return HttpNotFound();
            }
            return View(application);
        }

        // POST: Applications/Delete/5
        [HttpPost, ActionName("Delete")]
        [ValidateAntiForgeryToken]
        public ActionResult DeleteConfirmed(int id)
        {
            Application application = db.Applications.Find(id);
            db.Applications.Remove(application);
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
