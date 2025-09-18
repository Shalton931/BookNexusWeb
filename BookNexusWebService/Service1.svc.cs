using HashPass;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Runtime.Serialization;
using System.ServiceModel;
using System.ServiceModel.Web;
using System.Text;

namespace BookNexusWebService
{
    public class Service1 : IService1
    {
        DatabaseDataContext db = new DatabaseDataContext();

        public bool AddProduct(Book book)
        {
            var b = db.Books.FirstOrDefault(p => p.title == book.title && p.author == book.author &&
                                        p.Image == book.Image && p.description == book.description && p.genre == book.genre
                                        && p.quantity == book.quantity && p.language == book.language && p.price == book.price);

            if (b == null)
            {
                var Newbook = new Book
                {
                    title = book.title,
                    author = book.author,
                    Image = book.Image,
                    description = book.description,
                    genre = book.genre,
                    quantity = book.quantity,
                    language = book.language,
                    isActive = 1,
                    price = book.price
                };

                db.Books.InsertOnSubmit(Newbook);

                try
                {
                    db.SubmitChanges();
                    return true;
                }
                catch
                {
                    return false;
                }
            }
            else
            {
                return false;
            }
        }

        public bool AddtoCart(int userID, int bookID, int quantity)
        {
            var existingItem = db.ShoppingCarts.FirstOrDefault(c => c.user_Id == userID && c.book_ID == bookID);

            if (existingItem != null)
            {
                existingItem.quantity++;
            }
            else
            {
                var newCartItem = new ShoppingCart
                {
                    user_Id = userID,
                    book_ID = bookID,
                    quantity = quantity
                };
                db.ShoppingCarts.InsertOnSubmit(newCartItem);
            }

            try
            {
                db.SubmitChanges();
                return true;
            }
            catch
            {
                return false;
            }
        }

        public bool AddtoWishList(int userID, int bookID)
        {
            try
            {
                var existingItem = db.WishLists.FirstOrDefault(w => w.userid == userID && w.book_id == bookID);

                if (existingItem != null)
                {
                    return false;
                }
                else
                {
                    var newWishItem = new WishList
                    {
                        userid = userID,
                        book_id = bookID,
                    };
                    db.WishLists.InsertOnSubmit(newWishItem);
                }
                db.SubmitChanges();
                return true;
            }
            catch
            {
                return false;
            }
        }

        public bool ClearCart(int userId)
        {
            try
            {
                var cartItems = db.ShoppingCarts.Where(c => c.user_Id == userId);
                db.ShoppingCarts.DeleteAllOnSubmit(cartItems);
                db.SubmitChanges();
                return true;
            }
            catch
            {
                return false;
            }
        }

        public bool DeleteUserProfile(User user)
        {
            try
            {
                var delete = db.Users.FirstOrDefault(u => u.email == user.email);

                if (delete != null && (delete.isActive == 1) == true)
                {
                    db.Users.DeleteOnSubmit(delete);
                    db.SubmitChanges();
                    return true;
                }
                return false;
            }
            catch
            {
                return false;
            }
        }

        public void ForgotPasssword(string email, string newPassword)
        {
            var fp = db.Users.FirstOrDefault(u => u.email == email);
            if (fp != null)
            {
                fp.password = Secrecy.HashPassword(newPassword);
                db.SubmitChanges();
            }
        }

        public int GetActiveProductCount()
        {
            return db.Books.Count(p => p.isActive == 1);
        }

        public List<User> GetAllUsers()
        {
            var users = db.Users.Select(u =>
             new User
             {
                 user_ID = u.user_ID,
                 firstName = u.firstName,
                 lastName = u.lastName,
                 email = u.email,
                 isActive = u.isActive,
                 isLoggedin = u.isLoggedin,
                 type = u.type
             }).ToList();
            return users;
        }

        public string GetData(int value)
        {
            return string.Format("You entered: {0}", value);
        }

        public List<CartItem> GetCartItems(int userId)
        {
            var cartItems = (from ci in db.ShoppingCarts
                             join b in db.Books on ci.book_ID equals b.book_ID
                             where ci.user_Id == userId
                             select new CartItem
                             {
                              //   BookId = b.book_ID,
                                 Title = b.title,
                                 Price = b.price,
                                 Quantity = ci.quantity
                             }).ToList();
            return cartItems;
        }

        public List<Book> GetMostPurchased(int limit)
        {
            throw new NotImplementedException();
        }

        public Book GetProduct(int ID)
        {
            var prod = db.Books.FirstOrDefault(u => u.book_ID == ID);

            if (prod != null)
            {
                return new Book
                {
                    book_ID = prod.book_ID,
                    title = prod.title,
                    Image = prod.Image,
                    author = prod.author,
                    description = prod.description,
                    genre = prod.genre,
                    quantity = prod.quantity,
                    language = prod.language,
                    isActive = 1,
                    price = prod.price
                };
            }
            else
            {
                return null;
            }
        }

        public int GetProductCount()
        {
            return db.Books.Count();
        }

        public List<Book> GetProducts()
        {
            List<Book> books = new List<Book>();
            dynamic prods = (from b in db.Books
                             where b.isActive.Equals(1)
                             select b).DefaultIfEmpty();
            if (prods == null)
            {
                return null;
            }
            else
            {
                foreach (Book p in prods)
                {
                    var objBook = new Book();
                    objBook.book_ID = p.book_ID;
                    objBook.title = p.title;
                    objBook.description = p.description;
                    objBook.genre = p.genre;
                    objBook.Image = p.Image;
                    objBook.language = p.language;
                    objBook.quantity = p.quantity;
                    objBook.price = p.price;
                    books.Add(objBook);
                }
                return books;
            }
        }

        public User GetUser(int u_ID)
        {
            try
            {
                var user = (db.Users.FirstOrDefault(u => u.user_ID == u_ID));

                if (user == null)
                    return null;

                return new User
                {
                    user_ID = user.user_ID,
                    firstName = user.firstName,
                    lastName = user.lastName,
                    email = user.email,
                    isActive = user.isActive,
                    type = user.type,
                    isLoggedin = user.isLoggedin
                };
            }
            catch (Exception ex)
            {
                ex.GetBaseException();
                return null;
            }
        }

        public int GetUserCount()
        {
            return db.Users.Count();
        }

        public char GetUserType(User details)
        {
            var user = db.Users.FirstOrDefault(u => u.email == details.email && u.password == details.password);

            if (user != null)
            {
                return user.type;
            }
            return 'X';
        }

        public char Login(string email, string password)
        {
            var hashedPassword = Secrecy.HashPassword(password);
            var tempUser = (from u in db.Users
                            where u.email.Equals(email) &&
                            u.password.Equals(hashedPassword)
                            select u).FirstOrDefault();
            if (tempUser == null)
            {
                return '\0';
            }
            else
            {
                return tempUser.type;
            }
        }

        public User LoginUser(string email, string password)
        {
            var hashedPassword = Secrecy.HashPassword(password);
            var tempUser = (from u in db.Users
                            where u.email.Equals(email) &&
                            u.password.Equals(hashedPassword)
                            select u).FirstOrDefault();

            if (tempUser == null)
            {
                return null;
            }
            else
            {
                // Update login status
                tempUser.isLoggedin = 'Y';
                db.SubmitChanges();

                // Return user instance with ID and type
                return new User
                {
                    user_ID = tempUser.user_ID,
                    firstName = tempUser.firstName,
                   // lastName = tempUser.lastName,
                   // email = tempUser.email,
                    type = tempUser.type,
                    isLoggedin = tempUser.isLoggedin
                };
            }
        }

        public bool LogOut(string Email)
        {
            var status = db.Users.FirstOrDefault(u => u.email == Email);

            if (status == null)
            {
                return false;
            }
            else
            {
                status.isLoggedin = 'N';
                db.SubmitChanges();
                return true;
            }
        }

        public bool PlaceOder(int userID, List<int> prodsIds)
        {
            throw new NotImplementedException();
        }

        public int Register(string firstName, string lastName, string Email, string password, char userType)
        {
            var tempUser = (from u in db.Users
                            where u.email.Equals(Email)
                            select u).FirstOrDefault();

            if (tempUser == null)
            {
                var hashedPassword = Secrecy.HashPassword(password);
                var objUser = new User();
                objUser.firstName = firstName;
                objUser.lastName = lastName;
                objUser.email = Email;
                objUser.password = hashedPassword;
                objUser.isActive = 'Y';
                objUser.type = userType; 
                objUser.isLoggedin = 'N';
                db.Users.InsertOnSubmit(objUser);
                try
                {
                    db.SubmitChanges();
                    return 0; // Success
                }
                catch (Exception e)
                {
                    e.GetBaseException();
                    return -1; // Error
                }
            }
            else
            {
                return 1; // User already exists
            }
        }
        public bool RemoveFromCart(int userID, int bookID)
        {
            try
            {
                var existingItem = db.ShoppingCarts.FirstOrDefault(c => c.user_Id == userID && c.book_ID == bookID);

                if (existingItem != null)
                {
                    db.ShoppingCarts.DeleteOnSubmit(existingItem);
                    db.SubmitChanges();
                    return true;
                }
                return false;
            }
            catch
            {
                return false;
            }
        }

        public bool RemoveFromWishList(int userID, int bookID)
        {
            try
            {
                var existingItem = db.WishLists.FirstOrDefault(w => w.userid == userID && w.book_id == bookID);

                if (existingItem != null)
                {
                    db.WishLists.DeleteOnSubmit(existingItem);
                    db.SubmitChanges();
                    return true;
                }
                return false;
            }
            catch
            {
                return false;
            }
        }

        public bool RemoveProductByID(int ID, int quantity)
        {
            try
            {
                var product = db.Books.FirstOrDefault(p => p.book_ID == ID);

                if (product != null)
                {
                    product.quantity = quantity;
                    product.isActive = 0;
                    db.SubmitChanges();
                    return true;
                }
                return false;
            }
            catch
            {
                return false;
            }
        }

        public bool ResetUserDetails(string email, string oldpassword, string newPassword)
        {
            try
            {
                var hashedOldPassword = Secrecy.HashPassword(oldpassword);
                var hashedNewPassword = Secrecy.HashPassword(newPassword);

                var Resetuser = db.Users.FirstOrDefault(u => u.email == email && u.password == hashedOldPassword);

                if (Resetuser == null)
                    return false;

                Resetuser.password = hashedNewPassword;
                db.SubmitChanges();
                return true;
            }
            catch (Exception ex)
            {
                ex.GetBaseException();
                return false;
            }
        }

        public List<Book> SearchProducts(string keyword)
        {
            var availableProd = db.Books.Where(p => p.title.Contains(keyword) && p.isActive == 1).Take(10).Select(p => new Book
            {
                book_ID = p.book_ID,
                title = p.title,
                price = p.price,
                author = p.author
            }).ToList();
            return availableProd;
        }

        public bool UpdateProduct(Book book)
        {
            try
            {
                var update = db.Books.FirstOrDefault(p => p.book_ID == book.book_ID);

                if (update != null)
                {
                    update.title = book.title;
                    update.description = book.description;
                    update.quantity = book.quantity;
                    update.isActive = book.isActive;
                    update.price = book.price;
                    db.SubmitChanges();
                    return true;
                }
                return false;
            }
            catch
            {
                return false;
            }
        }
    }
}