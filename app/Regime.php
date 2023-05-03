<?php

namespace App;

use Illuminate\Database\Eloquent\Model;
use DB;

class Regime extends Model
{
    //
	protected $table = 'regime';
	protected $primaryKey = 'regime_id';
	public $timestamps = false;

}
