﻿using UnityEngine;
using System.Collections;

public class MoonBehaviour : MonoBehaviour {
    public float distance_to_screen;
    // Use this for initialization
    void Start () {
	
	}
	
	// Update is called once per frame
	void Update () {
	
	}
    void OnMouseDrag()
    {
        distance_to_screen = Camera.main.WorldToScreenPoint(gameObject.transform.position).z;
        transform.position = Camera.main.ScreenToWorldPoint(new Vector3(Input.mousePosition.x, Input.mousePosition.y, distance_to_screen));
    }
}
