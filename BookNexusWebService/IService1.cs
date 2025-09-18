using System;
using System.Collections.Generic;
using System.Linq;
using System.Runtime.Serialization;
using System.ServiceModel;
using System.ServiceModel.Web;
using System.Text;

namespace BookNexusWebService
{
    // NOTE: You can use the "Rename" command on the "Refactor" menu to change the interface name "IService1" in both code and config file together.
    [ServiceContract]
    public interface IService1
    {
        // User Related Contracts
        [OperationContract]
         int Register(string firstName, string lastName, string Email, string password, char userType);

        [OperationContract]
        char Login(String email, String password);
        [OperationContract]
        User LoginUser(string email, string password);

        [OperationContract]
        bool LogOut(String Email);

        [OperationContract]
        bool ResetUserDetails(String email, String oldpassword, String newPassword);

        [OperationContract]
        List<User> GetAllUsers();

        [OperationContract]
        User GetUser(int u_ID);

        [OperationContract]
        char GetUserType(User user);

        [OperationContract]
        int GetUserCount();

        [OperationContract]
        void ForgotPasssword(String email, String newPassword);

        [OperationContract]
        bool DeleteUserProfile(User user);

        //Product Related Contracts
        [OperationContract]
        //add book by admin
        bool AddProduct(Book books);

        [OperationContract]
        bool RemoveProductByID(int ID, int quantity);

        [OperationContract]
        bool UpdateProduct(Book book);

        [OperationContract]
        Book GetProduct(int ID);
        [OperationContract]
        bool ClearCart(int userId);
        [OperationContract]
        int GetProductCount();

        [OperationContract]
        List<Book> SearchProducts(String keyword);

        [OperationContract]
        List<Book> GetProducts(); 

        [OperationContract]
        List<Book> GetMostPurchased(int limit);

        [OperationContract]
        bool PlaceOder(int userID, List<int> prodsIds);
        /*
        [OperationContract]
        List<Order> GetOderByUser(int userID);

        [OperationContract]
        Invoice GenerateInvoice(int oderID);// gets invoice for an oder
        */
        [OperationContract]
        bool AddtoCart(int userID, int bookID, int quantity);

        [OperationContract]
        bool AddtoWishList(int userID, int bookID);

        [OperationContract]
        bool RemoveFromCart(int userID, int bookID);

        [OperationContract]
        bool RemoveFromWishList(int userID, int bookID);

        [OperationContract]
        List<CartItem> GetCartItems(int userId);

    }


}
