package finalmain

import org.springframework.core.ParameterizedTypeReference
import org.springframework.http.HttpEntity
import org.springframework.http.HttpMethod
import org.springframework.http.ResponseEntity
import org.springframework.web.client.RestTemplate
import org.springframework.web.util.UriComponentsBuilder

class ArticuloController {

    static allowedMethods = ['POST', 'GET', 'DELETE', 'PUT']

    def index(int offset) {


        def rest = new RestTemplate()

        String url = "http://localhost:8084/api/articulos/paginacion"
        UriComponentsBuilder builder = UriComponentsBuilder.fromUriString(url)
                .queryParam("limit", 6)
                .queryParam("offset", offset)

        ResponseEntity<List<Articulo>> lista = rest.exchange(builder.toUriString(), HttpMethod.GET, null, new ParameterizedTypeReference<List<Articulo>>() {
        })


        ResponseEntity<Long> cantidad = rest.exchange("http://localhost:8084/api/articulos/cantidad", HttpMethod.GET, null, Long)
        def paginas = Math.ceil(cantidad.getBody() / 6)

        [articulos: lista.getBody(), paginas: paginas]
    }


    def create() {

    }

    def show(int id) {

        def rest = new RestTemplate()

        ResponseEntity<Articulo> exchange = rest.exchange("http://localhost:8084/api/articulos/"+id, HttpMethod.GET, null, Articulo.class)



        [articulo: exchange.getBody(), cantidad: exchange.body.cantidadDisponible]

    }

    def salvar(Articulo articulo) {

        def rest = new RestTemplate()
        HttpEntity<Articulo> request = new HttpEntity<>(articulo)

        ResponseEntity<Articulo> exchange = rest.exchange("http://localhost:8084/api/articulos", HttpMethod.POST, request, Articulo.class);
        def status = exchange.statusCode

        println status

        redirect(view: create())

    }

    def list(int offset){

        def rest = new RestTemplate()

        String url = "http://localhost:8084/api/articulos/paginacion"
        UriComponentsBuilder builder = UriComponentsBuilder.fromUriString(url)
                .queryParam("limit", 6)
                .queryParam("offset", offset)

        ResponseEntity<List<Articulo>> lista = rest.exchange(builder.toUriString(), HttpMethod.GET, null, new ParameterizedTypeReference<List<Articulo>>() {
        })


        ResponseEntity<Long> cantidad = rest.exchange("http://localhost:8084/api/articulos/cantidad", HttpMethod.GET, null, Long)
        def paginas = Math.ceil(cantidad.getBody() / 6)

        [articulos: lista.getBody(), paginas: paginas]
    }


    def editar(int id){

        def rest = new RestTemplate()

        ResponseEntity<Articulo> exchange = rest.exchange("http://localhost:8084/api/articulos/"+id, HttpMethod.GET, null, Articulo.class)



        [articulo: exchange.getBody(), cantidad: exchange.body.cantidadDisponible]

    }

    def actualizar(Articulo articulo){

        def rest = new RestTemplate()
        HttpEntity<Articulo> request = new HttpEntity<>(articulo)

        ResponseEntity<Articulo> exchange = rest.exchange("http://localhost:8084/api/articulos", HttpMethod.PUT, request, Articulo)


        redirect(view:  list(0))
    }

    def eliminar(Long id){


        def rest = new RestTemplate()
        HttpEntity<Long> request = new HttpEntity<>(id)

        ResponseEntity<Long> exchange = rest.exchange("http://localhost:8084/api/articulos/"+id, HttpMethod.DELETE, null, Long)



        redirect(view: list(0))
    }

}
