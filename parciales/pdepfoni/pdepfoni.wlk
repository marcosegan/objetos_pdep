/* RESOLUCIÓN INCOMPLETA. PARCIAL MUY JODIDO. NO RECOMIENDO */

object tipoInternet { }
object tipoTelefono { }

class PackCredito {
    const saldo

    method puedeSatisfacer(consumo) {
        return saldo >= consumo.costo()
    }
}

class PackMegasLibres {
    const megas

    method puedeSatisfacer(consumo) {
        if (consumo.tipo() == tipoInternet) {
            // TODO: ¿unir con and?
            return megas >= consumo.megas()
        }
        return false
    }
}

object packLlamadasGratis {
    method puedeSatisfacer(consumo) {
        return consumo.tipo() == tipoTelefono
    }
}

object packInternetLosFindes {
    method puedeSatisfacer(consumo) {
        const dia = consumo.fecha().dayOfWeek()
        // en la hoja no eran strings !!! pero son strings !!!!!
        return consumo.tipo() == tipoInternet and (dia == "saturday" || dia == "sunday")
    }
}

class PackConVencimiento {
    const fechaVencimiento

    method vencio() {

    }
}


class Pack {

}

class Linea {
    const telefono
    const packs = []

    method agregarPack(pack) {
        packs.add(pack)
    }

    method puedeSatisfacer(consumo) {
    }
}


// Interfaz Consumo { tipo(), costo() }

class Consumo {
    const property fecha = new Date()

    method precioFijo() = 1
    method precioPorSegundo() = 0.05
    method precioPorMega() = 0.1
}

class ConsumoInternet inherits Consumo {
    const property megas

    method tipo() = tipoInternet
    method costo() = megas*self.precioPorMega()
}

class ConsumoTelefono inherits Consumo {
    const property duracion

    method tipo() = tipoTelefono
    method costo() = self.precioFijo() + duracion*self.precioPorSegundo()
}


object pdepfoni {
    const lineas = []

}

