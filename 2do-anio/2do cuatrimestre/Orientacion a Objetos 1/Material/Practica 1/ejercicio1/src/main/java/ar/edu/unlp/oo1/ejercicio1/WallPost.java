package ar.edu.unlp.oo1.ejercicio1;

/**
 * Completar esta clase de acuerdo a lo especificado
 */
public class WallPost {
	private String text;
	private int cantLikes;
	private boolean destacado;
	
	
	public WallPost() {
		this.text = "Undefined post";
		this.cantLikes = 0;
		this.destacado = false;
	}
	/**
	 * Retorna el texto descriptivo de la publicación
	 * 
	 * @return
	 */
	String getText() {
		return this.text;
	};

	/**
	 * Setea el texto descriptivo de la publicación
	 * @param text
	 */
	void setText(String text) {
		this.text = text;
	};

	/**
	 * Retorna la cantidad de “me gusta”
	 * 
	 * @return
	 */
	int getLikes() {
		return this.cantLikes;
	};

	/**
	 * Incrementa la cantidad de likes en uno
	 */
	void like() {
		this.cantLikes++;
	};

	/**
	 * Decrementa la cantidad de likes en uno. Si ya es 0, no hace nada
	 */
	void dislike() {
		if (this.cantLikes > 0)
			this.cantLikes--;
	};

	/**
	 * Retorna true si el post está marcado como destacado, false en caso contrario
	 * 
	 * @return
	 */
	boolean isFeatured() {
		if (this.destacado == true)
			return true;
		else
			return false;
	};

	/**
	 * Cambia el post del estado destacado a no destacado y viceversa
	 */
	void toggleFeatured() {
		this.destacado = !this.destacado;
	};

	/*
	 * Este mensaje se utiliza para que una instancia de Wallpost se muestre de forma adecuada
	 */
	@Override
	public String toString() {
		return "WallPost {" +
			"text: " + getText() +
			", likes: '" + getLikes() + "'" +
			", featured: '" + isFeatured() + "'" +
			"}";
	}

}