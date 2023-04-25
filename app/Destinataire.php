<?php

namespace App;

use Illuminate\Database\Eloquent\Model;
use DB;

class Destinataire extends Model
{
    //
	protected $table = 'destinataire';
	protected $primaryKey = 'destinataire_id';
	public $timestamps = false;

}
