from PyQt5 import QtWidgets, QtCore, QtGui
from pyswip import Prolog
import sys
import os

class VentanaResultados(QtWidgets.QWidget):
    def __init__(self, rutina, objetivos, lesiones):
        super().__init__()
        self.setWindowTitle("Resultados de la Rutina")
        self.resize(600, 800)

        # Estilo de la ventana
        self.setStyleSheet("""
            QWidget {
                font-family: Arial, sans-serif;
                font-size: 10pt;
            }
            QTextEdit {
                border: 1px solid #ccc;
                border-radius: 3px;
                padding: 10px;
            }
        """)

        # Layout principal
        layout = QtWidgets.QVBoxLayout()

        # Área de resultados
        self.resultado = QtWidgets.QTextEdit()
        self.resultado.setReadOnly(True)
        layout.addWidget(self.resultado)

        # Botón para cerrar la ventana
        boton_cerrar = QtWidgets.QPushButton("Cerrar")
        boton_cerrar.clicked.connect(self.close)
        layout.addWidget(boton_cerrar)

        self.setLayout(layout)

        # Mostrar los resultados
        self.mostrar_rutina(rutina, objetivos, lesiones)

    def mostrar_rutina(self, rutina, objetivos, lesiones):
        """
        Formatea e imprime la rutina semanal, objetivos y lesiones.
        """
        # Encabezado
        self.resultado.append("<h1 style='color: #4CAF50;'>Rutina Semanal</h1>")
        self.resultado.append("<p>¡Aquí tienes tu rutina personalizada para la semana!</p>")

        # Mostrar objetivos seleccionados
        self.resultado.append("<h2>Objetivos Seleccionados:</h2>")
        for objetivo in objetivos:
            self.resultado.append(f" - {objetivo.replace('_', ' ').title()}")
        self.resultado.append("")  # Espacio

        # Mostrar lesiones seleccionadas
        self.resultado.append("<h2>Lesiones Seleccionadas:</h2>")
        for lesion in lesiones:
            self.resultado.append(f" - {lesion.replace('_', ' ').title()}")
        self.resultado.append("")  # Espacio

        # Procesar la rutina
        self.resultado.append("<h2>Rutina por Día:</h2>")
        for dia in rutina:
            # Eliminar caracteres innecesarios y convertir a formato legible
            dia = dia.strip(",()")  # Eliminar comas y paréntesis
            dia_nombre, ejercicios = dia.split(", [")  # Separar día y lista de ejercicios
            dia_nombre = dia_nombre.strip().capitalize()  # Capitalizar el nombre del día
            ejercicios = ejercicios.strip("]").replace("'", "").split(", ")  # Limpiar y dividir ejercicios

            # Formatear la salida
            self.resultado.append(f"<b style='color: #007BFF;'>{dia_nombre}:</b>")
            for ejercicio in ejercicios:
                self.resultado.append(f" - {ejercicio.replace('_', ' ').title()}")
            self.resultado.append("")  # Espacio entre días

        # Añadir un mensaje final
        self.resultado.append("<p><i>¡Buena suerte con tu entrenamiento!</i></p>")


class RutinaApp(QtWidgets.QWidget):
    def __init__(self):
        super().__init__()
        self.initUI()
        self.prolog = Prolog()
        
        # Definir los predicados como dinámicos usando consult con una cadena
        self.prolog.consult("dynamic_predicates.pl")
        
        # Solución para el error de ruta en Windows
        try:
            # Opción 1: Usar ruta relativa si el archivo está en el mismo directorio
            if os.path.exists("bc.pl"):
                self.prolog.consult("bc.pl")
                print("Archivo bc.pl cargado correctamente")
            else:
                # Opción 2: Convertir barras invertidas a barras normales
                script_dir = os.path.dirname(os.path.abspath(_file_))
                prolog_file = os.path.join(script_dir, "bc.pl")
                # Convertir a formato que Prolog pueda entender
                prolog_file = prolog_file.replace("\\", "/")
                self.prolog.consult(prolog_file)
                print(f"Archivo {prolog_file} cargado correctamente")
        except Exception as e:
            print(f"Error al cargar el archivo Prolog: {e}")
            # Opción 3: Pedir al usuario que especifique la ruta
            self.mostrar_dialogo_archivo()

    def mostrar_dialogo_archivo(self):
        """Muestra un diálogo para seleccionar el archivo Prolog si no se puede cargar automáticamente"""
        dialogo = QtWidgets.QMessageBox()
        dialogo.setIcon(QtWidgets.QMessageBox.Warning)
        dialogo.setText("No se pudo cargar el archivo Prolog automáticamente.")
        dialogo.setInformativeText("Deseas seleccionar el archivo manualmente?")
        dialogo.setStandardButtons(QtWidgets.QMessageBox.Yes | QtWidgets.QMessageBox.No)
        dialogo.setDefaultButton(QtWidgets.QMessageBox.Yes)
        respuesta = dialogo.exec_()
        
        if respuesta == QtWidgets.QMessageBox.Yes:
            archivo, _ = QtWidgets.QFileDialog.getOpenFileName(
                self, "Seleccionar archivo Prolog", "", "Archivos Prolog (*.pl)"
            )
            if archivo:
                try:
                    # Convertir a formato que Prolog pueda entender
                    archivo = archivo.replace("\\", "/")
                    # Primero, definir los predicados como dinámicos
                    self.prolog.consult("dynamic_predicates.pl")
                    self.prolog.consult(archivo)
                    print(f"Archivo {archivo} cargado correctamente")
                except Exception as e:
                    QtWidgets.QMessageBox.critical(
                        self, "Error", f"No se pudo cargar el archivo: {e}"
                    )
                    sys.exit(1)
            else:
                sys.exit(1)
        else:
            sys.exit(1)
        
    def initUI(self):
        self.setWindowTitle("Sistema Experto de Recomendación de Ejercicios")
        self.setStyleSheet("""
            QWidget {
                font-family: Arial, sans-serif;
                font-size: 10pt;
            }
            QGroupBox {
                font-weight: bold;
                border: 1px solid #ccc;
                border-radius: 5px;
                margin-top: 10px;
                padding-top: 10px;
            }
            QPushButton {
                background-color: #4CAF50;
                color: white;
                border: none;
                padding: 8px 16px;
                border-radius: 4px;
                font-weight: bold;
            }
            QPushButton:hover {
                background-color: #45a049;
            }
            QLineEdit, QComboBox, QSpinBox {
                padding: 5px;
                border: 1px solid #ccc;
                border-radius: 3px;
            }
            QTextEdit {
                border: 1px solid #ccc;
                border-radius: 3px;
            }
        """)
        
        layout = QtWidgets.QVBoxLayout()

        # Formulario principal
        form_layout = QtWidgets.QFormLayout()
        
        # Datos básicos
        self.nombre = QtWidgets.QLineEdit()
        self.nivel_actividad = QtWidgets.QComboBox()
        self.nivel_actividad.addItems(["baja", "moderada", "alta"])
        
        form_layout.addRow("Nombre:", self.nombre)
        form_layout.addRow("Nivel de actividad:", self.nivel_actividad)
        
        # Objetivos (checkboxes)
        objetivos_group = QtWidgets.QGroupBox("Objetivos")
        objetivos_layout = QtWidgets.QVBoxLayout()
        
        self.objetivos = {}
        objetivos_opciones = [
            "perdida_peso", "ganancia_muscular", "aerobico", 
            "flexibilidad", "entrenamiento_funcional"
        ]
        
        for objetivo in objetivos_opciones:
            checkbox = QtWidgets.QCheckBox(objetivo.replace("_", " ").title())
            self.objetivos[objetivo] = checkbox
            objetivos_layout.addWidget(checkbox)
        
        objetivos_group.setLayout(objetivos_layout)
        
        # Lesiones (checkboxes)
        lesiones_group = QtWidgets.QGroupBox("Lesiones")
        lesiones_layout = QtWidgets.QVBoxLayout()
        
        self.lesiones = {}
        lesiones_opciones = [
            "dolor_espalda", "rodillas_debiles", "lesion_hombro", 
            "dolor_cuello", "dolor_munecas", "lesion_tobillo"
        ]
        
        for lesion in lesiones_opciones:
            checkbox = QtWidgets.QCheckBox(lesion.replace("_", " ").title())
            self.lesiones[lesion] = checkbox
            lesiones_layout.addWidget(checkbox)
        
        lesiones_group.setLayout(lesiones_layout)
        
        # Disponibilidad (días de la semana)
        disponibilidad_group = QtWidgets.QGroupBox("Disponibilidad (horas por día)")
        disponibilidad_layout = QtWidgets.QGridLayout()
        
        dias_semana = ["lunes", "martes", "miercoles", "jueves", "viernes", "sabado", "domingo"]
        self.disponibilidad = {}
        
        for i, dia in enumerate(dias_semana):
            label = QtWidgets.QLabel(dia.capitalize())
            spinner = QtWidgets.QSpinBox()
            spinner.setRange(0, 5)
            spinner.setSpecialValueText("No disponible")
            spinner.setSuffix(" hora(s)")
            
            disponibilidad_layout.addWidget(label, i, 0)
            disponibilidad_layout.addWidget(spinner, i, 1)
            
            self.disponibilidad[dia] = spinner
        
        disponibilidad_group.setLayout(disponibilidad_layout)
        
        # Añadir todos los grupos al layout principal
        layout.addLayout(form_layout)
        layout.addWidget(objetivos_group)
        layout.addWidget(lesiones_group)
        layout.addWidget(disponibilidad_group)
        
        # Botón para generar rutina
        self.boton = QtWidgets.QPushButton("Generar Rutina")
        self.boton.clicked.connect(self.generar_rutina)
        layout.addWidget(self.boton)
        
        # Área de resultados
        self.resultado = QtWidgets.QTextEdit()
        self.resultado.setReadOnly(True)
        layout.addWidget(QtWidgets.QLabel("Rutina:"))
        layout.addWidget(self.resultado)
        
        self.setLayout(layout)
        self.resize(500, 700)  # Ventana más grande para acomodar todos los controles

    def generar_rutina(self):
        # Validar datos
        if not self.nombre.text().strip():
            QtWidgets.QMessageBox.warning(self, "Error", "Por favor ingrese su nombre")
            return
        
        # Obtener objetivos seleccionados
        objetivos_seleccionados = [
            objetivo for objetivo, checkbox in self.objetivos.items() 
            if checkbox.isChecked()
        ]
        
        if not objetivos_seleccionados:
            QtWidgets.QMessageBox.warning(self, "Error", "Por favor seleccione al menos un objetivo")
            return
        
        # Obtener lesiones seleccionadas
        lesiones_seleccionadas = [
            lesion for lesion, checkbox in self.lesiones.items() 
            if checkbox.isChecked()
        ]
        
        # Obtener disponibilidad
        dias_disponibles = {
            dia: horas.value() for dia, horas in self.disponibilidad.items() 
            if horas.value() > 0
        }
        
        if not dias_disponibles:
            QtWidgets.QMessageBox.warning(self, "Error", "Por favor indique su disponibilidad en al menos un día")
            return
        
        # Preparar consultas Prolog
        nombre_usuario = self.nombre.text().strip()
        nivel_actividad = self.nivel_actividad.currentText()
        
        try:
            # Mostrar mensaje de procesamiento
            self.resultado.setText("Generando rutina personalizada...")
            QtWidgets.QApplication.processEvents()  # Actualizar la interfaz
            
            # Limpiar datos anteriores usando abolish en lugar de retractall
            # Esto evita errores de permisos con procedimientos estáticos
            try:
                # Usar retract para eliminar todos los hechos
                list(self.prolog.query("retractall(usuario(_, _))"))
                list(self.prolog.query("retractall(objetivoCuestionario(_, _))"))
                list(self.prolog.query("retractall(lesion(_, _))"))
                list(self.prolog.query("retractall(disponibilidad(_, _, _))"))
            except Exception as e:
                print(f"Advertencia al limpiar datos: {e}")
                # Continuar de todos modos
            
            # Insertar datos del usuario
            # Usar comillas para el nombre de usuario para evitar errores de sintaxis
            list(self.prolog.query(f"assert(usuario('{nombre_usuario}', {nivel_actividad}))"))
            
            # Insertar objetivos
            objetivos_str = "[" + ", ".join(objetivos_seleccionados) + "]"
            list(self.prolog.query(f"assert(objetivoCuestionario('{nombre_usuario}', {objetivos_str}))"))
            
            # Insertar lesiones
            for lesion in lesiones_seleccionadas:
                list(self.prolog.query(f"assert(lesion('{nombre_usuario}', {lesion}))"))
            
            # Insertar disponibilidad
            for dia, horas in dias_disponibles.items():
                list(self.prolog.query(f"assert(disponibilidad('{nombre_usuario}', {dia}, {horas}))"))
            
            # Consultar rutina semanal
            resultado = list(self.prolog.query(f"rutina_semanal('{nombre_usuario}', Rutina)"))
            
            if resultado:
                rutina = resultado[0]['Rutina']
                self.abrir_ventana_resultados(rutina, objetivos_seleccionados, lesiones_seleccionadas)
            else:
                self.resultado.setText("No se pudo generar una rutina con los datos proporcionados.\n\n"
                                      "Posibles causas:\n"
                                      "- Conflicto entre objetivos y lesiones\n"
                                      "- Insuficientes ejercicios disponibles para tus restricciones\n\n"
                                      "Intenta modificar tus objetivos o disponibilidad.")
        
        except Exception as e:
            self.resultado.setText(f"Error: {str(e)}")
            print(f"Error detallado: {e}")
    
    def abrir_ventana_resultados(self, rutina, objetivos, lesiones):
        self.ventana_resultados = VentanaResultados(rutina, objetivos, lesiones)
        self.ventana_resultados.show()


if __name__ == "__main__":
    app = QtWidgets.QApplication(sys.argv)
    ventana = RutinaApp()
    ventana.show()
    sys.exit(app.exec_())