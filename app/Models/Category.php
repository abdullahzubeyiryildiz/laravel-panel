<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Model;
use Illuminate\Database\Eloquent\SoftDeletes;

class Category extends Model
{
  use SoftDeletes;
    public function productCount(){
      return $this->hasMany('App\Models\Product','category_id','id')->where('status',1)->count();
                  // Bağlanacağımız Model   // Bağlanacağımız Sütun // Bağlancak id
    }
}
