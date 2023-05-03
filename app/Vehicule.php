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


	public function user_entree1()
    {
        return $this->hasOne(User::class, 'id','vehicule_user_entree1');
    }
    public function user_entree2()
    {
        return $this->hasOne(User::class, 'id','vehicule_user_entree2');
    }
    public function user_sortie1()
    {
        return $this->hasOne(User::class, 'id','vehicule_user_sortie1');
    }
    public function user_sortie2()
    {
        return $this->hasOne(User::class, 'id','vehicule_user_sortie2');
    }


}