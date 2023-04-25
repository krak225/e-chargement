<?php

namespace App;

use Illuminate\Database\Eloquent\Model;
use DB;

class Entree_sortie extends Model
{
    //
	protected $table = 'entree_sortie';
	protected $primaryKey = 'entree_sortie_id';
	public $timestamps = false;

}
