<?php

use Illuminate\Database\Seeder;
use Illuminate\Support\Facades\DB;
use Illuminate\Support\Str;

class CategorySeeder extends Seeder
{
    /**
     * Run the database seeds.
     *
     * @return void
     */
    public function run()
    {
        $categories=['Genel','Kategori 1','Kategori 2','Kategori 3','Kategori 4'];
        foreach($categories as $category){
          $slug = Str::slug($category, '-');
          DB::table('categories')->insert([
            'name'=>$category,
            'slug'=>  $slug,
            'created_at'=>now(),
            'updated_at'=>now()
          ]);
        }

    }
}
