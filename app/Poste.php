<?php

namespace App;

use Illuminate\Database\Eloquent\Model;
use DB;

class Poste extends Model
{
    //
	protected $table = 'poste';
	protected $primaryKey = 'poste_id';
	public $timestamps = false;

}
