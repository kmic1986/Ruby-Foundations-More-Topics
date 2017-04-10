def rot(string)
  new_string = ''
  string.each_char do |char|
    if char.downcase <= 'z' && char.downcase >= 'n'
      new_string += (char.ord - 13).chr
    elsif char.downcase <= 'm' && char.downcase >= 'a'
      new_string += (char.ord + 13).chr
    else
      new_string += char
    end
  end
  new_string
end

puts rot(
'Nqn Ybirynpr
Tenpr Ubccre
Nqryr Tbyqfgvar
Nyna Ghevat
Puneyrf Onoontr
Noqhyynu Zhunzznq ova Zhfn ny-Xujnevmzv
Wbua Ngnanfbss
Ybvf Unyog
Pynhqr Funaaba
Fgrir Wbof
Ovyy Tngrf
Gvz Orearef-Yrr
Fgrir Jbmavnx
Xbaenq Mhfr
Wbua Ngnanfbss
Fve Nagbal Ubner
Zneiva Zvafxl
Lhxvuveb Zngfhzbgb
Unllvz Fybavzfxv
Tregehqr Oynapu')
