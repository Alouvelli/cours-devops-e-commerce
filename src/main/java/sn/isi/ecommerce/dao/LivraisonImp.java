package sn.isi.ecommerce.dao;

import java.util.List;

import javax.persistence.EntityManager;
import javax.persistence.EntityManagerFactory;
import javax.persistence.Persistence;

import sn.isi.ecommerce.entities.Commande;
import sn.isi.ecommerce.entities.Facturation;
import sn.isi.ecommerce.entities.Livraison;
import sn.isi.ecommerce.entities.Produit;

public class LivraisonImp implements ILivraison {

	 private EntityManager em;
	  
	 private Livraison livraison;
	    
    public LivraisonImp() {
        EntityManagerFactory emf = Persistence
                .createEntityManagerFactory("ecommercePU");
        em = emf.createEntityManager();
    }

	@Override
	public List<Livraison> getAllLivraison() {
		try {
			return em.createQuery("SELECT l FROM Livraison l").getResultList();
		} catch (Exception e) {
			e.printStackTrace();
			return null;
		}
	}

	@Override
	public Livraison saveLivraison(Commande commande) {
		livraison.setCommande(commande);
		 try {
	            em.getTransaction().begin();
	            em.persist(livraison);
	            em.getTransaction().commit();
	            return livraison;
	        }
	        catch(Exception e)
	        {
	            e.printStackTrace();
	            return null;
	        }
	}

	@Override
	public Livraison get(String livraison) {
		return null;
	}


	public Livraison get(int id) {
		return em.find(Livraison.class, id);
	}

}
