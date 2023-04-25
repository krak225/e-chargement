<?php

namespace App;

use Illuminate\Database\Eloquent\Model;
use DB;

class Declarant extends Model
{
    //
	protected $table = 'declarant';
	protected $primaryKey = 'declarant_id';
	public $timestamps = false;

}
