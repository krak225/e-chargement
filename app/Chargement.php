<?php

namespace App;

use Illuminate\Database\Eloquent\Model;
use DB;

class Chargement extends Model
{
    //
	protected $table = 'chargement';
	protected $primaryKey = 'chargement_id';
	public $timestamps = false;

}
