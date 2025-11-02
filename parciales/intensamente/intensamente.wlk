/* RESOLUCIÓN INCOMPLETA */

object riley {
    var felicidad = 1000
    var emocion
    const recuerdos = []
    const pensamientosCentrales = #{}

    method vivir(descripcion, recuerdo) {
        //recuerdos.add(evento.recuerdo())
        recuerdos.add(new Evento(descripcion=descripcion, recuerdo=recuerdo))
    }

    method entristecer() {
        felicidad *= 0.9
        if (felicidad < 1) {
            throw new Exception("felicidad < 1")
        }
    }

    method recuerdosRecientes() {
        // recuerdos.sortBy({ rec1, rec2 => rec1 < rec2 })
        return recuerdos.reverse().take(5)

        // recuerdos.sortBy({ rec1, rec2 => rec1 > rec2 })
        // return recuerdos.take(5)
    }

    method agregarPensamiento(recuerdo) {
        pensamientosCentrales.add(recuerdo)
    }

    method pensamientosDificiles() {
        return pensamientosCentrales.filter({ recuerdo => recuerdo.descripcion().words() > 10 })
    }

    // procesos mentales

    method asentamiento() {
        recuerdos.forall({ recuerdo => recuerdo.asentar() })
    }
    method asentamientoSelectivo(palabraClave) {
        recuerdos.filter({ recuerdo => recuerdo.descripcion() == palabraClave })

    }


    method dormir() {

        .forall({ recuerdo => recuerdo.asentar() })

    }
}




class Recuerdo {
    const descripcion
    const fecha
    const emocion

    method asentar(persona) {}
    method esNegado(persona) {}
}

class RecuerdoAlegre inherits Recuerdo {
    method asentar(persona) {
        if (persona.felicidad() > 500) {
            persona.agregarPensamiento(self)
        }
    }

    method esNegado(emocion) {

    }
}

class RecuerdoTriste inherits Recuerdo {
    method asentar(persona) {
        persona.agregarPensamiento(self)
        persona.entristecer()
    }
}
