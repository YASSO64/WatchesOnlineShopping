/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Admin;

import Beans.User;
import dbconnection.UsersDB;
import java.io.File;
import java.io.IOException;
import java.io.InputStream;
import java.io.PrintWriter;
import java.sql.SQLException;
import java.util.Iterator;
import java.util.List;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.Part;
import org.apache.commons.fileupload.FileItem;
import org.apache.commons.fileupload.FileUploadException;
import org.apache.commons.fileupload.disk.DiskFileItemFactory;
import org.apache.commons.fileupload.servlet.ServletFileUpload;

/**
 *
 * @author Rania
 */
@WebServlet(name = "SignUp", urlPatterns = {"/SignUp"})
public class SignUpServ extends HttpServlet {

  

    
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws IOException, ServletException
    { 
      
    
     
        }
        
    

    
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        
         
      String username=null;
      String password=null;
      String email=null;
      String creditnumber=null;
      String userjob=null;
      String imagename=null;
      String birthdate=null;
      String address=null;
      String gender=null;
      
      String path=request.getServletContext().getRealPath("")+"\\images\\";
        System.out.println("kkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkk"+path);
        
        DiskFileItemFactory factory = new DiskFileItemFactory();
            ServletFileUpload upload = new ServletFileUpload(factory);

            List<FileItem> items;
        try {
            items = upload.parseRequest( request);
            Iterator<FileItem> iter = items.iterator();
           
            while (iter.hasNext())
            {
                    FileItem item = iter.next();
                    if (item.isFormField())
                    {
                      if(item.getFieldName().equals("username"))
                      {
                          username=item.getString();
                           System.out.print("user name"+username);
                      }
                      
                      if(item.getFieldName().equals("psw"))
                      {
                          password=item.getString();
                                         System.out.print("password"+password);
                      }
                        if(item.getFieldName().equals("email"))
                      {
                            email=item.getString();
                            System.out.print("email"+email);
                      }
                           if(item.getFieldName().equals("creditnumber"))
                      {
                            creditnumber=item.getString();
                            System.out.print("creditnumber"+creditnumber);
                      }
                          if(item.getFieldName().equals("job"))
                      {
                            userjob=item.getString();
                            System.out.print("job"+userjob);
                      }       
                          
                               if(item.getFieldName().equals("birthday"))
                      {
                           birthdate=item.getString();
                         System.out.print("birthday"+birthdate);
                      } 
                               if(item.getFieldName().equals("addresss"))
                      {
                           address=item.getString();
                         System.out.print("address"+ address);
                      }    
                      
                               
                               
                    } else {
                              if (!item.isFormField()) 
                                  
                    { 
                          
                                   imagename="images/"+item.getName();
                                   item.write(new File(path+ item.getName()));
                    }
                    }}
                      User user =new  User();
                      
                      user.setCredit_number(creditnumber);
                      user.setBirthDate(birthdate);
                    
                      System.out.print(email);

                      user.setPassword(password);
                      user.setProfile_pic(imagename);
                      user.setUser_email(email);
                      user.setUser_job(userjob);
                      user.setUser_name(username);
                      user.setUser_address(address);
                     
                      UsersDB userdb=new UsersDB();
                      userdb.insertUser(user);
                      response.sendRedirect("index.jsp");
                       System.out.println(" End poooooooooooooooooooooooooooooooooooooooooooost");
                  

        } catch (FileUploadException ex) {
            Logger.getLogger(SignUpServ.class.getName()).log(Level.SEVERE, null, ex);
        } catch (Exception ex) {
            Logger.getLogger(SignUpServ.class.getName()).log(Level.SEVERE, null, ex);
        }
       
            
        
       
    
      
 
        
    }

    /**
     * Returns a short description of the servlet.
     *
     * @return a String containing servlet description
     */
    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}
