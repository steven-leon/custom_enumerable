# lib/enumerable_methods.rb

module EnumerableMethods
#   Un módulo en Ruby es como una caja de herramientas: contiene métodos que puedes usar en otras partes del programa, sin necesidad de crear un objeto de esa clase.

#   Es parecido a una clase, pero:

#  No se pueden crear objetos (instancias) directamente de un módulo.

# Se usa para agrupar funciones relacionadas.

# Puedes incluirlo en una clase para que esa clase tenga esos métodos.
  def my_each
    return to_enum(:my_each) unless block_given?
    # block_given? es un método en Ruby que verifica si se ha pasado un bloque al método.

    # unless significa "a menos que". Por lo tanto, esta línea:
    #   "Si NO se ha pasado un bloque al método, devuelve un enumerador."

    # to_enum crea un enumerador basado en el método actual (my_each en este caso).

    # Un enumerador es un objeto especial que se puede usar para recorrer colecciones con otros métodos, como map, select, etc.

    for i in 0...self.length
      yield(self[i])
    end

    self
  end

  def my_select
    return to_enum(:my_select) unless block_given?

    result = []
    self.my_each do |item|
      result << item if yield(item)
    end
    result
  end

  def my_map
    return to_enum(:my_map) unless block_given?

    result = []
    self.my_each do |item|
      result << yield(item)
    end
    result
    #result << item if yield(item):

    # yield(item) evalúa el bloque pasado al método con el elemento item como argumento.

    # Si el bloque retorna true, entonces el elemento item se agrega (o "empuja") al array result usando el operador <<.

    # Si el bloque retorna false, el elemento no se agrega al array.
  end

  def my_all?
    self.my_each do |item|
      return false unless yield(item)
    end
    true
  end

  def my_any?
    self.my_each do |item|
      return true if yield(item)
    end
    false
  end

  def my_none?
    self.my_each do |item|
      return false if yield(item)
    end
    true
  end

  def my_count
    count = 0
    if block_given?
      self.my_each { |item| count += 1 if yield(item) }
    else
      count = self.length
    end
    count
  end

  def my_inject(initial = nil)
    array = self.dup
    accumulator = initial.nil? ? array.shift : initial

    array.my_each do |item|
      accumulator = yield(accumulator, item)
    end

    accumulator
  end
end

# Incluimos el módulo en Array para poder usar los métodos directamente
class Array
  include EnumerableMethods
end
