<?php

include_once 'Database.php'; 

class Genre extends Database
{
    private $genre_id;
    private $genre_type;
    
    public function __construct($genre_id,$genre_type) 
    {
        $this->genre_id = $genre_id;
        $this->genre_type = $genre_type;
       
    }
    
    public function getGenreId()
    {
        return $this->genre_id;
    }
    
    public function getGenreType()
    {
        return $this->genre_type;
    }
    
    public function getAllValues() 
    {
        $allValues = 
                     "\n"."genre_id : ".$this->genre_id. "\n".
                     " Author name : ".$this->genre_type."\n";
        return $allValues;
    }

}

