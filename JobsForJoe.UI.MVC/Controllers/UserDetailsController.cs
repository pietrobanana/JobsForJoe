using System;
using System.Collections.Generic;
using System.Data;
using System.Data.Entity;
using System.Linq;
using System.Net;
using System.Web;
using System.Web.Mvc;
using JobsForJoe.Data.EF;
using System.Drawing;
using cStoreMVC.Doamin.Services;
using Microsoft.AspNet.Identity;

namespace JobsForJoe.UI.MVC.Controllers
{
    public class UserDetailsController : Controller
    {
        private JobsForJoeEntities db = new JobsForJoeEntities();

        // GET: UserDetails
        public ActionResult Index()
        {
            return View(db.UserDetails.ToList());
        }

        // GET: UserDetails/Details/5
        public ActionResult Details(string id)
        {
            if (id == null)
            {
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            }
            UserDetail userDetail = db.UserDetails.Find(id);
            if (userDetail == null)
            {
                return HttpNotFound();
            }
            return View(userDetail);
        }

        // GET: UserDetails/Create
        public ActionResult Create()
        {
            return View();
        }

        // POST: UserDetails/Create
        // To protect from overposting attacks, please enable the specific properties you want to bind to, for 
        // more details see http://go.microsoft.com/fwlink/?LinkId=317598.
        [HttpPost]
        [ValidateAntiForgeryToken]
        public ActionResult Create([Bind(Include = "UserID,FirstName,LastName,ResumeFileName,BaristaImage,IsEmployed,Bio")] UserDetail userDetail, HttpPostedFileBase userPicture, HttpPostedFileBase resumeFile)
        {
            if (ModelState.IsValid)
            {
                #region FILE UPLOAD (CREATE)
                string resumeDoc = "noPDF.pdf";
                if (resumeFile != null)
                {
                    //Find the extension
                    resumeDoc = resumeFile.FileName;
                    string imgExtension = resumeFile.FileName.Substring(resumeDoc.LastIndexOf("."));

                    string[] goodExtensions = { ".pdf", ".docx", ".doc", ".dot", ".txt" };

                    if (goodExtensions.Contains(imgExtension.ToLower()))
                    {
                        resumeDoc = User.Identity.GetUserId() + imgExtension;

                        string savePath = Server.MapPath("~/Content/Resumes/");

                        resumeFile.SaveAs(savePath + resumeDoc);
                        resumeDoc = Guid.NewGuid() + imgExtension; // Create unique file name with a guid. 
                    }
                    else
                    {
                        //handle invalid file type somehow...
                        resumeDoc = "noPDF.pdf";
                    }
                }

                //Regardless of whether a file was uploaded, set the image name on the db record (hijack record)
                userDetail.ResumeFileName = resumeDoc;

                #endregion


                #region FILE UPLOAD (CREATE) WITH IMAGE SERVICE
                string imageName = "NoImage.jpg";
                if (userPicture != null)
                {
                    //Find the extension
                    imageName = userPicture.FileName;
                    string imgExtension = userPicture.FileName.Substring(imageName.LastIndexOf("."));

                    string[] goodExtensions = { ".jpg", ".jpeg", ".gif", ".png" };

                    if (goodExtensions.Contains(imgExtension.ToLower()))
                    {
                        imageName = Guid.NewGuid() + imgExtension; // Create unique file name with a guid. 

                        //Rather than save this file to the server directly, we'll use imageservice* to do it.
                        //make 2 copies, main & thumbnail.

                        //Lets make all the param that we need.
                        string imgPath = Server.MapPath("~/Content/Images/Users/"); //Folder path.

                        Image convertedImage = Image.FromStream(userPicture.InputStream); //Manipulates the file to be used in imageservices*

                        //Choose max img size
                        int maxImageSize = 500;

                        //Set max size for thumbnails in pixels
                        int maxThumbSize = 100;

                        //Call ResizeImage() from ImageServices*
                        ImageServices.ResizeImage(imgPath, imageName, convertedImage, maxImageSize, maxThumbSize);

                    }
                    else
                    {
                        //handle invalid file type somehow...
                        imageName = "NoImage.jpg";
                    }
                }

                //Regardless of whether a file was uploaded, set the image name on the db record (hijack record)
                userDetail.BaristaImage = imageName;

                #endregion


                db.UserDetails.Add(userDetail);
                db.SaveChanges();
                return RedirectToAction("Index");
            }

            return View(userDetail);
        }

        // GET: UserDetails/Edit/5
        public ActionResult Edit(string id)
        {
            if (id == null)
            {
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            }
            UserDetail userDetail = db.UserDetails.Find(id);
            if (userDetail == null)
            {
                return HttpNotFound();
            }
            return View(userDetail);
        }

        // POST: UserDetails/Edit/5
        // To protect from overposting attacks, please enable the specific properties you want to bind to, for 
        // more details see http://go.microsoft.com/fwlink/?LinkId=317598.
        [HttpPost]
        [ValidateAntiForgeryToken]
        public ActionResult Edit([Bind(Include = "UserID,FirstName,LastName,ResumeFileName,BaristaImage,IsEmployed,Bio")] UserDetail userDetail, HttpPostedFileBase userPicture, HttpPostedFileBase resumeFile)
        {
            if (ModelState.IsValid)
            {
                #region FILE UPLOAD (Edit) WITH IMAGE SERVICE
                //Took out the noimage default from the create. When the user edits it will not override the image that was uploaded by them.
                if (resumeFile != null)
                {
                    //Find the extension
                    //VARIATION FOR EDIT - VARIABLE DECLARATION HAPPENS HERE, ADD "STRING"DATATYPE
                    string resumeDoc = resumeFile.FileName;
                    string docExtension = resumeFile.FileName.Substring(resumeDoc.LastIndexOf("."));

                    string[] goodExtensions = { ".jpg", ".jpeg", ".gif", ".png" };

                    if (goodExtensions.Contains(docExtension.ToLower()))
                    {
                        resumeDoc = Guid.NewGuid() + docExtension; // Create unique file name with a guid. 

                    }
                    else
                    {
                        //handle invalid file type somehow...
                        //VARIATION FOR EDIT -- JUST LEACE IT AT ORIGINAL FILE (HANDLED BY HIDDEN FIELD)
                        //imageName = "NoImage.jpg";
                    }
                    //VARIATION FOR EDIT-- MOVED RECORD HIJACK FOR BOOKIMAGE FIELD ASSIGNMENT TO HAPPEN ONLY IF USER UPLOADED A FILE.
                    userDetail.ResumeFileName = resumeDoc;
                }




                #endregion


                #region FILE UPLOAD (Edit) WITH IMAGE SERVICE
                //Took out the noimage default from the create. When the user edits it will not override the image that was uploaded by them.
                if (userPicture != null)
                {
                    //Find the extension
                    //VARIATION FOR EDIT - VARIABLE DECLARATION HAPPENS HERE, ADD "STRING"DATATYPE
                    string imageName = userPicture.FileName;
                    string imgExtension = userPicture.FileName.Substring(imageName.LastIndexOf("."));

                    string[] goodExtensions = { ".jpg", ".jpeg", ".gif", ".png" };

                    if (goodExtensions.Contains(imgExtension.ToLower()))
                    {
                        imageName = Guid.NewGuid() + imgExtension; // Create unique file name with a guid. 

                        //Rather than save this file to the server directly, we'll use imageservice* to do it.
                        //make 2 copies, main & thumbnail.

                        //Lets make all the param that we need.
                        string imgPath = Server.MapPath("~/Content/Images/Users/"); //Folder path.

                        Image convertedImage = Image.FromStream(userPicture.InputStream); //Manipulates the file to be used in imageservices*

                        //Choose max img size
                        int maxImageSize = 500;

                        //Set max size for thumbnails in pixels
                        int maxThumbSize = 100;

                        //Call ResizeImage() from ImageServices*
                        ImageServices.ResizeImage(imgPath, imageName, convertedImage, maxImageSize, maxThumbSize);

                    }
                    else
                    {
                        //handle invalid file type somehow...
                        //VARIATION FOR EDIT -- JUST LEACE IT AT ORIGINAL FILE (HANDLED BY HIDDEN FIELD)
                        //imageName = "NoImage.jpg";
                    }
                    //VARIATION FOR EDIT-- MOVED RECORD HIJACK FOR BOOKIMAGE FIELD ASSIGNMENT TO HAPPEN ONLY IF USER UPLOADED A FILE.
                    userDetail.BaristaImage = imageName;
                }




                #endregion
                //var UserId = User.Identity.GetUserId();
                //userDetail.UserID = UserId;
                db.Entry(userDetail).State = EntityState.Modified;
                db.SaveChanges();
                return RedirectToAction("Index");
            }
            return View(userDetail);
        }

        // GET: UserDetails/Delete/5
        public ActionResult Delete(string id)
        {
            if (id == null)
            {
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            }
            UserDetail userDetail = db.UserDetails.Find(id);
            if (userDetail == null)
            {
                return HttpNotFound();
            }
            return View(userDetail);
        }

        // POST: UserDetails/Delete/5
        [HttpPost, ActionName("Delete")]
        [ValidateAntiForgeryToken]
        public ActionResult DeleteConfirmed(string id)
        {
            UserDetail userDetail = db.UserDetails.Find(id);
            db.UserDetails.Remove(userDetail);
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
