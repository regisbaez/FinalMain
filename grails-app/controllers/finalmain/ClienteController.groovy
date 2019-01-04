package finalmain

import grails.converters.JSON
import org.springframework.http.HttpEntity
import org.springframework.http.HttpMethod
import org.springframework.http.ResponseEntity
import org.springframework.web.client.RestTemplate

class ClienteController {

    def index() {

    }

    def registrar() {}

    def salvar(Cliente cliente) {

        def rest = new RestTemplate()

        HttpEntity<Cliente> request = new HttpEntity<>(cliente)

        ResponseEntity<Cliente> response = rest.postForEntity("http://localhost:8084/api/clientes/devolver", request, Cliente.class)

        println "nuevo id de cliente: " + response.getBody().getId()

        redirect(uri: '/cliente/registrar')
    }

    def agregarArticulo(int id, int cantidad) {

        def rest = new RestTemplate()

        ResponseEntity<Articulo> exchange = rest.exchange("http://localhost:8084/api/articulos/" + id, HttpMethod.GET, null, Articulo.class)

        String anterior = session.getAttribute("carrito")
        String[] cantidadArticulos
        def res = []

        if (anterior != null) {

            cantidadArticulos = anterior.split('\\(')

            def precioNuevo = (int) Float.parseFloat(cantidadArticulos[0]) + (int) exchange.getBody().getPrecio()
            def cantidadNueva = Integer.parseInt(cantidadArticulos[1]) + cantidad

            session["carrito"] = "$precioNuevo($cantidadNueva"


            res = [precioNuevo: precioNuevo, cantidad: cantidadNueva, error: false]

            render res as JSON

            return false

        } else {

//            def precio = exchange.getBody().getPrecio()
            session["carrito"] = exchange.getBody().precio + "($cantidad"

            println "articulo: " + exchange.body.precio
            res = [error: true]

            render res as JSON
        }


    }
}
