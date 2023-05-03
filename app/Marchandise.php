<?php

namespace App;

use Illuminate\Database\Eloquent\Model;
use DB;

class Marchandise extends Model
{
    //
	protected $table = 'marchandise';
	protected $primaryKey = 'marchandise_id';
	public $timestamps = false;

}
