package com.luv2code.springdemo.dao;

import java.util.List;

import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.query.Query;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;
import org.springframework.transaction.annotation.Transactional;

import com.luv2code.springdemo.entity.Customer;

@Repository
public class CustomerDAOImp implements CustomerDAO {

	
	//need to inject the session factory
	@Autowired
	private SessionFactory sessionFactory;
	
	@Override
	public List<Customer> getCustomers() {
		
		//get the current hibernate session
		Session curretnSession = sessionFactory.getCurrentSession();
		
		//create query
		Query<Customer> theQuery = curretnSession.createQuery("from Customer order by lastName", Customer.class);
				
		//execute query and get result list
		List<Customer> customers = theQuery.getResultList();
		
		//return the result
		return customers;
		
	}

	@Override
	public void saveCustomer(Customer theCustomer) {
		
		//get current hibernate session
		Session currentSession = sessionFactory.getCurrentSession();
		
		//save/update the customer..
		currentSession.saveOrUpdate(theCustomer);
		
		
	}

	@Override
	public Customer getCustomers(int theId) {
		
		//get current hibernate session
		Session currentSession = sessionFactory.getCurrentSession();
				
		//now retrieve/read from db using the pk
		Customer theCustomer = currentSession.get(Customer.class, theId);
		
		return theCustomer;
	}

	@Override
	public void deleteCustomer(int theId) {
		
		//get current hibernate session
		Session currentSession = sessionFactory.getCurrentSession();
		
		//delete the customer
		Query theQuery= 
				currentSession.createQuery("delete from Customer where id=:customerId");
		theQuery.setParameter("customerId", theId);
		
		theQuery.executeUpdate();
	}

}
