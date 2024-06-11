package Modelo;

public class Historial {
    private Materias materia;
    private Materias_alumnos materiaAlumno;
    
    public Historial(Materias materia, Materias_alumnos materiaAlumno) {
        this.materia = materia;
        this.materiaAlumno = materiaAlumno;
    }
    
    public Materias getMateria() {
        return materia;
    }
    
    public void setMateria(Materias materia) {
        this.materia = materia;
    }
    
    public Materias_alumnos getMateriaAlumno() {
        return materiaAlumno;
    }
    
    public void setMateriaAlumno(Materias_alumnos materiaAlumno) {
        this.materiaAlumno = materiaAlumno;
    }
}