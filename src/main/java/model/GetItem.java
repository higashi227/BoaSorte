package model;

import java.util.List;

import dao.ItemDAO;


public class GetItem{
	public List<Item> execute(){
		ItemDAO dao = new ItemDAO();
		List<Item> itemList = dao.findAll();
		return itemList;

	}
} 