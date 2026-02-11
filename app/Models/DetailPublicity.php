<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class DetailPublicity extends Model
{
    use HasFactory;
    protected $table = 'detail_publicities';
    protected $primaryKey = 'id';
    protected $fillable = 
    [
        'imagen'
    ];
}
