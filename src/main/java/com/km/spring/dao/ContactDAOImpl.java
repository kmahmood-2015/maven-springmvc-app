package com.km.spring.dao;
 
import java.util.List;
 
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Repository;
 
import com.km.spring.model.Contact;
 
@Repository
public class ContactDAOImpl implements ContactDAO {
     
    private static final Logger logger = LoggerFactory.getLogger(ContactDAOImpl.class);
 
    private SessionFactory sessionFactory;
     
    public void setSessionFactory(SessionFactory sf){
        this.sessionFactory = sf;
    }
 
    @Override
    public void addContact(Contact c) {
        Session session = this.sessionFactory.getCurrentSession();
        session.persist(c);
        logger.info("Contact saved successfully, Contact Details="+c);
    }
 
    @Override
    public void updateContact(Contact c) {
        Session session = this.sessionFactory.getCurrentSession();
        session.update(c);
        logger.info("Contact updated successfully, Contact Details="+c);
    }
 
    @SuppressWarnings("unchecked")
    @Override
    public List<Contact> listContacts() {
        Session session = this.sessionFactory.getCurrentSession();
        List<Contact> contactsList = session.createQuery("from Contact").list();
        for(Contact c : contactsList){
            logger.info("Contact List::"+c);
        }
        return contactsList;
    }
 
    @Override
    public Contact getContactById(int id) {
        Session session = this.sessionFactory.getCurrentSession();      
        Contact c = (Contact) session.load(Contact.class, new Integer(id));
        logger.info("Contact loaded successfully, Contact details="+c);
        return c;
    }
 
    @Override
    public void removeContact(int id) {
        Session session = this.sessionFactory.getCurrentSession();
        Contact c = (Contact) session.load(Contact.class, new Integer(id));
        if(null != c){
            session.delete(c);
        }
        logger.info("Contact deleted successfully, contact details="+c);
    }
 
}
