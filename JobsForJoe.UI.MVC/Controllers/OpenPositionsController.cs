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
using JobsForJoe.UI.MVC.Models;

namespace JobsForJoe.UI.MVC.Controllers
{
    [Authorize(Roles =("Admin, Store Manager, Employee"))]
    public class OpenPositionsController : Controller
    {
        private JobsForJoeEntities db = new JobsForJoeEntities();

        // GET: OpenPositions
        public ActionResult Index()
        {
            var openPositions = db.OpenPositions.Include(o => o.Location).Include(o => o.Position);
            string currentUserId = User.Identity.GetUserId();

            UserDetail user = db.UserDetails.FirstOrDefault(x => x.UserID == currentUserId);
            if (User.IsInRole("Employee") || (User.IsInRole("Admin")))
            {
                if (User.IsInRole("Employee"))
                {
                    var apps = db.Applications.Where(m => m.ResumeFilename == user.ResumeFileName);

                    var ops = db.OpenPositions.Include(o => o.Location).Include(o => o.Position);

                    List<int> appliedOpenPositions = new List<int>();

                    foreach (var item in apps)
                    {
                        foreach (var op in ops)
                        {
                            //If the OpenPositionId and the OpenPositionID on the resume match, add it to the list above.
                            if (item.OpenPositionID == op.OpenPositionID)
                            {
                                appliedOpenPositions.Add(op.OpenPositionID);
                            }
                        }
                    }

                    //Adds a list to the ViewBag to show in the View.
                    ViewBag.AppliedOP = appliedOpenPositions;
                }

                return View(openPositions.ToList());
            }
            else
            {
                var locationIDs = db.Locations.Where(l => l.ManagerID == currentUserId).Select(l => l.LocationID);
                var opList = db.OpenPositions.Where(op => locationIDs.Contains(op.LocationID)).ToList();
                return View(opList.ToList());
            }


        }

        // GET: OpenPositions/Details/5
        public ActionResult Details(int? id)
        {
            if (id == null)
            {
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            }
            OpenPosition openPosition = db.OpenPositions.Find(id);
            if (openPosition == null)
            {
                return HttpNotFound();
            }
            return View(openPosition);
        }

        // GET: OpenPositions/Create
        public ActionResult Create()
        {
            if (User.IsInRole("Admin"))
            { 
            ViewBag.LocationID = new SelectList(db.Locations, "LocationID", "StoreName");
            ViewBag.PositionID = new SelectList(db.Positions, "PositionID", "Title");
            return View();
            }

            else
            {
            string currentUserId = User.Identity.GetUserId();
            ViewBag.LocationID = new SelectList(db.Locations.Where(model => model.ManagerID == currentUserId), "LocationID", "StoreName");
            ViewBag.PositionID = new SelectList(db.Positions, "PositionID", "Title");
            return View();
            }

        }

        // POST: OpenPositions/Create
        // To protect from overposting attacks, please enable the specific properties you want to bind to, for 
        // more details see http://go.microsoft.com/fwlink/?LinkId=317598.
        [HttpPost]
        [ValidateAntiForgeryToken]
        public ActionResult Create([Bind(Include = "OpenPositionID,PositionID,LocationID")] OpenPosition openPosition)
        {
            if (ModelState.IsValid)
            { 
                db.OpenPositions.Add(openPosition);
                db.SaveChanges();
                return RedirectToAction("Index");
            }

            ViewBag.LocationID = new SelectList(db.Locations, "LocationID", "StoreName", openPosition.LocationID);
            ViewBag.PositionID = new SelectList(db.Positions, "PositionID", "Title", openPosition.PositionID);
            return View(openPosition);
        }

        // GET: OpenPositions/Edit/5
        public ActionResult Edit(int? id)
        {
            if (id == null)
            {
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            }
            OpenPosition openPosition = db.OpenPositions.Find(id);
            if (openPosition == null)
            {
                return HttpNotFound();
            }
            ViewBag.LocationID = new SelectList(db.Locations, "LocationID", "StoreName", openPosition.LocationID);
            ViewBag.PositionID = new SelectList(db.Positions, "PositionID", "Title", openPosition.PositionID);
            return View(openPosition);
        }

        // POST: OpenPositions/Edit/5
        // To protect from overposting attacks, please enable the specific properties you want to bind to, for 
        // more details see http://go.microsoft.com/fwlink/?LinkId=317598.
        [HttpPost]
        [ValidateAntiForgeryToken]
        public ActionResult Edit([Bind(Include = "OpenPositionID,PositionID,LocationID")] OpenPosition openPosition)
        {
            if (ModelState.IsValid)
            {
                db.Entry(openPosition).State = EntityState.Modified;
                db.SaveChanges();
                return RedirectToAction("Index");
            }
            ViewBag.LocationID = new SelectList(db.Locations, "LocationID", "StoreName", openPosition.LocationID);
            ViewBag.PositionID = new SelectList(db.Positions, "PositionID", "Title", openPosition.PositionID);
            return View(openPosition);
        }

        public ActionResult Apply(int id)
        {
            string currentUserId = User.Identity.GetUserId();
            UserDetail user = db.UserDetails.FirstOrDefault(x => x.UserID == currentUserId);
            Application app = new Application();
            app.UserID = user.UserID;
            app.OpenPositionID = id;
            app.ApplicationDate = DateTime.Now;
            app.ResumeFilename = user.ResumeFileName;

            
            db.Applications.Add(app);
            db.SaveChanges();
            return RedirectToAction("Index", "Applications");
        }




        // GET: OpenPositions/Delete/5
        public ActionResult Delete(int? id)
        {
            if (id == null)
            {
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            }
            OpenPosition openPosition = db.OpenPositions.Find(id);
            if (openPosition == null)
            {
                return HttpNotFound();
            }
            return View(openPosition);
        }

        // POST: OpenPositions/Delete/5
        [HttpPost, ActionName("Delete")]
        [ValidateAntiForgeryToken]
        public ActionResult DeleteConfirmed(int id)
        {
            OpenPosition openPosition = db.OpenPositions.Find(id);
            db.OpenPositions.Remove(openPosition);
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
