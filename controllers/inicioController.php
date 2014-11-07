<?php

class inicioController extends Controller
{
    public function __construct() {
        parent::__construct();
    }

    public function index()
    {
        $this->_view->renderizar('index','header','footer');
       
    }
    public function register()
    {
        $this->_view->renderizar('register','header','footer','inicio');
       
    }
}
?>