<?php

class postModel extends Model
{
    public function __construct() {
        parent::__construct();
    }
    
    public function  getPosts()
    {
        $post = $this->_db->query('select * from tpersona inner join tvehiculo on tpersona.Idpersona=tvehiculo.Idpersona');
        return $post->fetchall();
        
    }
    public function insertarPost($idPersona,$Dni, $Nombre, $Apellidos)
    {
        $this->_db->prepare("INSERT INTO tpersona VALUES (:idPersona, :Dni, :Nombre, :Apellidos)")
                ->execute(
                        array(
                           ':idPersona' => $idPersona,
                           ':Dni' => $Dni,
                           ':Nombre' => $Nombre,
                           ':Apellidos' => $Apellidos
                        ));
    }
}
?>