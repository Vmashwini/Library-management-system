<?php

//include_once 'Author.php';
//include_once 'Book.php';

class BookAuthor 
{
    private $bookId;
    private $authorId;

    public function __construct($bookId, $authorId) 
    {
        $this->bookId = $bookId;
        $this->authorId = $authorId;
    }
    
    public function getBookId()
    {
        return $this->bookId;
    }
    
    public function getAuthorId()
    {
        return $this->authorId;
    }
    
    /*public function isWrittenBy($firstName, $lastName)
    {
        $fullName = $firstName." ".$lastName;
        $status = false;
        if ($this->m_author->getName() == $fullName)
        {
            $status = true;
        }
        else
        {
            $status = false;
        }
        return status;
    }*/
    public function getAllValues()
    {
        $allColumns = 
                       "Book id : ". $this->bookId."\n". 
                       "Author Id : ".$this->authorId."\n"; 

        return $allColumns; 
    }
}


