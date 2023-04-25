<?php

namespace App;

use Illuminate\Database\Eloquent\Model;
use DB;

class Declaration extends Model
{
    //
	protected $table = 'declaration';
	protected $primaryKey = 'declaration_id';
	public $timestamps = false;

}
