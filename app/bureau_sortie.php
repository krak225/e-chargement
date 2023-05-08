<?php

namespace App;

use Illuminate\Database\Eloquent\Model;
use DB;

class Bureau_sortie extends Model
{
    //
	protected $table = 'bureau_sortie';
	protected $primaryKey = 'bureau_sortie_id';
	public $timestamps = false;

}
