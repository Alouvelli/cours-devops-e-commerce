<%@include file="../../../header.jsp"%>
<%@page import="java.util.List"%>
<%@page import="sn.isi.ecommerce.entities.Categorie"%>
<%
List<Categorie> categories = (List) request.getAttribute("categories");
String isModification = (request.getParameter("isModification") != null) ? request.getParameter("isModification"): "false";
int idCategorie = (request.getParameter("idCategorie") != null) ? Integer.parseInt(request.getParameter("idCategorie")): -1;
%>
<div class="container">
	<h2>Gestion des cat�gories</h2>
	<div class="row">
		<!-- FORM  -->
		<div class="col-md-6">
			<form action="CategorieServlet" method="POST" class="form-horizontal"
				id="form-edit-client">
				<fieldset>

					<!-- Form Name -->
					<legend>Cat�gorie</legend>

					<!-- Text input-->
					<div class="form-group">
						<label class="col-md-4 control-label" for="client-name">Libell�</label>
						<div class="col-md-4">
							<input id="libelleCategorie" name="libelle-categorie" type="text"
								placeholder="libell�" class="form-control input-md">
						</div>
						
						<%
						if(isModification.equals("true"))
						{
							Categorie categorie = null;
							for(Categorie c : categories) { 
								   if(c.getId() == idCategorie) { 
								       categorie = c;
								   }
								}
						%>	
						<div class="col-md-4">
							<input id="libelleCategorie" name="ancien-libelle-categorie" type="text"
								placeholder="Ancien libell�" class="form-control input-md" value="<%=categorie.getLibelle()%>" disabled>
						</div>
						<%
						}
						%>
					</div>
					<!-- Button -->
					<div class="form-group">
						<label class="col-md-4 control-label" for="btn-save"></label>
						<div class="col-md-4">
							<button id="btn-save" name="btn-save" class="btn btn-success">Enregistrer</button>
						</div>
					</div>
				</fieldset>
			</form>


		</div>

		<!-- LIST -->
		<div class=col-md-6>

			<form id="form-list-client">
				<legend>Liste des cat�gories</legend>

				<table class="table table-bordered table-condensed table-hover">
					<thead>
						<tr>
							<th>Libelle</th>
							<th>Actions</th>
						</tr>

					</thead>
					<tbody id="form-list-client-body">

						<%
						for (int i = 0; i < categories.size(); i++) {
						%>
						<%
						Categorie c = (Categorie) categories.get(i);
						%>
						<tr>
							<td><%=c.getLibelle()%></td>
							<td><a href="CategorieServlet?action=edit&id=<%=c.getId()%>" title="Modifier cat�gorie"
								class="btn btn-info btn-sm "> Modifier </a> <a href="CategorieServlet?action=delete&id=<%=c.getId()%>"
								title="Supprimer cat�gorie" class="btn btn-danger btn-sm ">
									Supprimer </a></td>
						</tr>
						<%
						}
						%>
					</tbody>
				</table>
			</form>
		</div>
	</div>
</div>

<%@include file="../../../footer.jsp"%>