<?php

namespace App;

use Illuminate\Database\Eloquent\Model;
use DB;

class Vehicule extends Model
{
    //
	protected $table = 'vehicule';
	protected $primaryKey = 'vehicule_id';
	public $timestamps = false;

}