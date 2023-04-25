<?php

namespace App;

use Illuminate\Database\Eloquent\Model;
use DB;

class Expediteur extends Model
{
    //
	protected $table = 'expediteur';
	protected $primaryKey = 'expediteur_id';
	public $timestamps = false;

}
