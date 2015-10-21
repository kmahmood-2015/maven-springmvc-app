package com.km.spring.dao;
 
import java.util.List;
 
import com.km.spring.model.Contact;
 
public interface ContactDAO {
 
    public void addContact(Contact c);
    public void updateContact(Contact c);
    public List<Contact> listContacts();
    public Contact getContactById(int id);
    public void removeContact(int id);
}

