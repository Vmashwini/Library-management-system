<?php

class Database
{
    protected $totalRows;
    
    public function countData()
    {
        echo "Display how many rows in library database";
    }
    
    public function getAllValues()
    {
        echo "You are in parent database class";
        echo "No values set for it yet";
    }
}
