<?php

namespace App;

use Illuminate\Database\Eloquent\Model;
use DB;

class Pays extends Model
{
    //
	protected $table = 'pays';
	protected $primaryKey = 'pays_id';
	public $timestamps = false;

}
