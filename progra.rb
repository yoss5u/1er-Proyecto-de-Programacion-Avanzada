require 'terminal-table'

cola_autores = {
    tope: nil,
    fondo: nil,
    max: 5
}

cola_ventas = {
    tope: nil,
    fondo: nil,
    codigo: 0,
    max: 20
}

def size(cola)
    tamano = 0
    a = cola[:tope]
    while a != nil
        tamano += 1
        a = a[:siguiente]
    end
    return tamano
end

def llena?(cola)
    if size(cola) == cola[:max]
        return true
    else
        return false
    end
end

def vacia?(cp)
    if cp[:tope] == nil
        return true
    else
        return false
    end
end

def limpiar
    system('clear')
end

def continuar
    puts ''
    puts 'Pulse enter para continuar'
    gets
    system('clear')
end

def buscar(cp, buscado, tipo)
    a = cp[:tope]
    while a != nil
        if a[tipo] == buscado
            break
        else
            a = a[:siguiente]
        end
    end
    return a
end

def buscar_libro(cola_autores, isbn)
    a = cola_autores[:tope]
    while a != nil
        if buscar(a,isbn,:isbn) == nil
            a = a[:siguiente]
        else
            a = buscar(a,isbn,:isbn)
            break
        end
    end
    return a
end

def insertar_cola(cola, elemento)
    a = cola[:tope]
    begin
        if a == nil
            cola[:tope] = elemento
            cola[:fondo] = elemento
            break
        elsif a[:siguiente] == nil
            a[:siguiente] = elemento
            cola[:fondo] = elemento
            break
        else
            a = a[:siguiente]
        end
    end while a != nil
end
