package com.km.spring.service;
 
import java.util.List;
 
import com.km.spring.model.Contact;
 
public interface ContactService {
 
    public void addContact(Contact c);
    public void updateContact(Contact c);
    public List<Contact> listContacts();
    public Contact getContactById(int id);
    public void removeContact(int id);
     
}
