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
            string currentUserId = User.Identity.GetUserId();//<--Gets Id from current user.
            UserDetail user = db.UserDetails.FirstOrDefault(x => x.UserID == currentUserId); //<--pairs it to the userId from the user details

            List<UserDetail> deets = db.UserDetails.ToList();
            ViewBag.UserDetails = deets;
            if (User.IsInRole("Admin"))
            {
                var applications = db.Applications.Include(a => a.OpenPosition);
                return View(applications.ToList());
            }
            else
            {
                if (User.IsInRole("Store Manager"))
                {

                   

                    //var apps = db.Applications;

                    //var loc = db.OpenPositions;

                    //List<int> manApps = new List<int>();

                    //foreach (var item in apps)
                    //{
                    //    foreach (var m in loc)
                    //    {
                    //        if (item.OpenPositionID == m.OpenPositionID)
                    //        {
                    //            manApps.Add(m.OpenPositionID);
                    //        }
                    //    }
                    //}

                    //Adds a list to the ViewBag to show in the View.
                    //ViewBag.ManagerApps = manApps;


                }

                else
                {
                    return View(db.Applications.Where(x => x.UserID == currentUserId));
                }

                var applications = db.Applications.Include(a => a.OpenPosition);
                return View(applications.ToList());
            }
        }

        // GET: Applications/Details/5
        public ActionResult Details(int? id)
        {
            List<UserDetail> deets = db.UserDetails.ToList();
            ViewBag.UserDetails = deets;
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
