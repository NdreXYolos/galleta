<%@ taglib uri="http://java.sun.com/jstl/core_rt" prefix="c" %>
<!DOCTYPE html>
<html lang="esS" >
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1, user-scalable=no">
<script type="text/javascript" src="js/jquery.min.js"></script>
<script type="text/javascript" src="js/bootstrap.min.js"></script>
<script type="text/javascript" src="js/bootstrapValidator.js"></script>
<link rel="stylesheet" href="css/bootstrap.css"/>
<link rel="stylesheet" href="css/bootstrapValidator.css"/>
<title>Ejemplos de CIBERTEC - Jorge Jacinto </title>
</head>
<body>

<div class="container">
<h1>Registra Galleta</h1>

	<c:if test="${sessionScope.MENSAJE != null}">
		<div class="alert alert-success fade in" id="success-alert">
		 <a href="#" class="close" data-dismiss="alert">&times;</a>
		 <strong>${sessionScope.MENSAJE}</strong>
		</div>
	</c:if>
	<c:remove var="MENSAJE" />
	
	<form action="registroDeGalleta" id="id_form"> 

			<div class="form-group">
				<label class="control-label" for="id_nombre">Nombre</label>
				<input class="form-control" type="text" id="id_nombre" name="nombre" placeholder="Ingrese el nombre" maxlength="40">    
			</div>
			
			<div class="form-group">
				<label class="control-label" for="id_stock">Stock</label>
				<input class="form-control" type="text" id="id_stock" name="stock" placeholder="Ingrese el stock" maxlength="8">    
			</div>
			
			<div class="form-group">
				<label class="control-label" for="id_fecha">Fecha de Vencimiento</label>
				<input class="form-control" type="date" id="id_fecha" name="fechaVencimiento" placeholder="La fecha de vencimiento" maxlength="100">    
			</div>
			
			
			<div class="form-group">
				<label class="control-label" for="id_categoria">Categoria</label>
				<select class="form-control" id="id_categoria" name="categoria.idCategoria" class='form-control'>
					<option value=" ">[Seleccione Categoria]</option>    
				</select>
		    </div>
			<div class="form-group">
				<button type="submit" class="btn btn-primary" >Crea Galleta</button>
			</div>
	</form>
</div>

<script type="text/javascript">
$("#success-alert").fadeTo(1000, 500).slideUp(500, function(){
    $("#success-alert").slideUp(500);
});
</script>

<script type="text/javascript">
console.log("Inicio");
$.getJSON("cargaCategoria",{}, function(data){
	console.log(data);
	$.each(data,function(i,item){
		$("#id_categoria").append("<option value='"+ item.idCategoria+"'>" +  item.nombre +"<option>");
	});
});


</script>


<!-- 
	https://mkyong.com/tutorials/java-regular-expression-tutorials/

 -->
<script type="text/javascript">
$(document).ready(function() {
    $('#id_form').bootstrapValidator({
        message: 'This value is not valid',
        feedbackIcons: {
            valid: 'glyphicon glyphicon-ok',
            invalid: 'glyphicon glyphicon-remove',
            validating: 'glyphicon glyphicon-refresh'
        },
        fields: {
        		nombre:{
                    selector: "#id_nombre",
                    validators:{
                        notEmpty: {
                             message: 'El nombre es obligatorio'
                        },
                        stringLength: {
                            min: 3,
                            max: 40,
                            message: 'El nombre es de 3 a 40 caracteres'
                        },
                    }
                },
                stock:{
                    selector: "#id_stock",
                    validators:{
                        notEmpty: {
                             message: 'El stock es obligatorio'
                        }
                    }
                },
                fechaVencimiento:{
                    selector: "#id_fecha",
                    validators:{
                        notEmpty: {
                             message: 'La fecha es obligatorio'
                        }
                    }
                },
        }   
    });

    // Validate the form manually
    $('#validateBtn').click(function() {
        $('#id_form').bootstrapValidator('validate');
    });
});
</script>

</body>
</html>




