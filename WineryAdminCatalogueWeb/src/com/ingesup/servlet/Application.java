package com.ingesup.servlet;

import java.io.IOException;
import java.util.ArrayList;
import java.util.Properties;

import javax.naming.Context;
import javax.naming.InitialContext;
import javax.naming.NamingException;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.ingesup.exception.DaoException;
import com.ingesup.winery.ejb.produit.RemoteProduitManager;
import com.ingesup.winery.entity.Produit;

public class Application extends HttpServlet {
    private static final long serialVersionUID = 1L;

    private Context ctx;
    private RemoteProduitManager produitManager;

    private String urlListe;
    private String urlModif;

    private String id, appellation, cuvee, millesime, prix, producteur, stock;

    public void init() {
	Properties props = new Properties();
	props.setProperty("java.naming.provider.url", "localhost:1099");
	props.setProperty("java.naming.factory.initial",
		"org.jnp.interfaces.NamingContextFactory");
	props.setProperty("java.naming.factory.url.pkgs",
		"org.jboss.naming:org.jnp.interfaces");

	try {
	    ctx = new InitialContext(props);
	    produitManager = (RemoteProduitManager) ctx
		    .lookup(RemoteProduitManager.JNDI_NAME);
	} catch (NamingException e) {
	    e.printStackTrace();
	}

	urlListe = getServletConfig().getInitParameter("urlListe");
	urlModif = getServletConfig().getInitParameter("urlModif");
    }

    public void doGet(HttpServletRequest req, HttpServletResponse rep)
	    throws ServletException, IOException {
	req.setCharacterEncoding("UTF-8");
	String action = req.getParameter("action");
	if (action == null) {
	    action = "liste";
	}
	System.out.println("Action demandee : " + action);

	if (action.equals("modifier")) {
	    long id = Long.parseLong(req.getParameter("id"));

	    req.setAttribute("produit", produitManager.getById(id));
	    getServletContext().getRequestDispatcher(urlModif)
		    .forward(req, rep);
	} else {
	    if (action.equals("supprimer")) {
		long id = Long.parseLong(req.getParameter("id"));
		Produit produitToDel = produitManager.getById(id);
		produitManager.delete(produitToDel);
	    }

	    else if (action.equals("inserer")) {
		appellation = req.getParameter("appellation");
		cuvee = req.getParameter("cuvee");
		millesime = req.getParameter("millesime");
		prix = req.getParameter("prix");
		producteur = req.getParameter("producteur");
		stock = req.getParameter("stock");

		ArrayList<String> erreurs = verifQualite();
		if (erreurs.size() == 0) {

		    Produit produit = new Produit();
		    produit.setAppellation(appellation);
		    produit.setCuvee(cuvee);
		    produit.setMillesime(millesime);
		    produit.setPrix(Float.parseFloat(prix.replace(",", ".")));
		    produit.setProducteur(producteur);
		    produit.setStock(Long.parseLong(stock));
		    produit = produitManager.save(produit);

		} else {
		    String msg = "";
		    for (String erreur : erreurs) {
			msg += erreur + "<br />";
		    }
		    throw new DaoException(msg, 3);
		}
	    }

	    else if (action.equals("valideModif")) {
		id = req.getParameter("id");
		appellation = req.getParameter("appellation");
		cuvee = req.getParameter("cuvee");
		millesime = req.getParameter("millesime");
		prix = req.getParameter("prix");
		producteur = req.getParameter("producteur");
		stock = req.getParameter("stock");

		ArrayList<String> erreurs = verifQualite();
		if (erreurs.size() == 0) {
		    Produit produit = new Produit();
		    produit.setId(Long.parseLong(id));
		    produit.setAppellation(appellation);
		    produit.setCuvee(cuvee);
		    produit.setMillesime(millesime);
		    produit.setPrix(Float.parseFloat(prix.replace(",", ".")));
		    produit.setProducteur(producteur);
		    produit.setStock(Long.parseLong(stock));

		    produit = produitManager.update(produit);
		} else {
		    String msg = "";
		    for (String erreur : erreurs) {
			msg += erreur + "<br />";
		    }
		    throw new DaoException(msg, 3);
		}
	    }
	    if (produitManager.getAll() != null) {
		req.setAttribute("liste", produitManager.getAll());
	    }

	    getServletContext().getRequestDispatcher(urlListe)
		    .forward(req, rep);
	}
    }

    public void doPost(HttpServletRequest req, HttpServletResponse rep)
	    throws ServletException, IOException {
	doGet(req, rep);
    }

    private ArrayList<String> verifQualite() {
	ArrayList<String> res = new ArrayList<String>();
	if (appellation.length() == 0) {
	    res.add("L'appellation ne doit pas etre vide...");
	}
	if (cuvee.length() == 0) {
	    res.add("La cuvee ne doit pas etre vide...");
	}
	if (millesime.length() == 0) {
	    res.add("Le millesime ne doit pas etre vide...");
	}
	if (producteur.length() == 0) {
	    res.add("Le producteur ne doit pas etre vide...");
	}
	if (stock.length() == 0) {
	    res.add("Le stock ne doit pas etre vide...");
	}
	 if (!stock.matches("^([0-9]+)$")) {
	 res.add("Le stock doit etre un entier positif...");
	 }
	if (prix.length() == 0) {
	    res.add("Le prix ne doit pas etre vide...");
	}
	 if (!prix.matches("^([0-9]+)(.|,)?([0-9]+)$")) {
	 res.add("Le prix doit etre un nombre positif...");
	 }
	return res;
    }
}
